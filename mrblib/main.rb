require './mrblib/docker'
require './mrblib/actions/container'

Dir.foreach('./mrblib/actions') do |path|
  if path.end_with?('.rb')
    puts "Loading actions/#{path}..."
    require("./mrblib/actions/#{path}")
  end
end

Dir.foreach('./mrblib/objects') do |path|
  if path.end_with?('.rb')
    puts "Loading objects/#{path}..."
    require("./mrblib/objects/#{path}")
  end
end

require './mrblib/http'
require './mrblib/consul'
require './mrblib/docker-events'
require './mrblib/docker-client'


d = Docker::Action::ContainerStarted.new()

$manager = Mongoose::Manager.new
$docker_hosts = []

if File.exist?('/proc/self/cgroup')
  myid = `head -1 /proc/self/cgroup|cut -d/ -f5`.strip
  LOCAL_MODE = false
else
  myid = ""
  LOCAL_MODE = true
end

if LOCAL_MODE
  $docker_hosts << ['rancher1', 'tcp://127.0.0.1:3341']
  $docker_hosts << ['rancher2', 'tcp://127.0.0.1:3342']
  $consul_address = 'tcp://95.140.12.77:8500'
else
  $docker_hosts << ['rancher1', 'tcp://169.254.249.45:3344']
  $docker_hosts << ['rancher2', 'tcp://169.254.249.57:3344']
  $consul_address = 'tcp://169.254.249.99:8500'
end


# Fiber.new do
#   consul = Consul.new(manager, 'tcp://95.140.12.77:8500')
#   consul.register_service('test2', '172.17.0.3', 3344, {
#     'Interval' => '2m',
#     'Timeout' => '10s', # tcp connection timeout
#     'DeregisterCriticalServiceAfter' => '5m',
#     # 'HTTP' => '/test',
#     'TCP' => '3344'
#   })
  
# end.resume

$consul = Consul.new($manager, $consul_address)


#### script API

$containers_change_block = nil
def on_containers_change(&block)
  $containers_change_block = block
end

$update_required_block = nil
def update_required(&block)
  $update_required_block = block
end

def register_service(name, opts = {})
  
  params = {
    'Interval' => opts.delete('Interval') || '2m',
    'Timeout' => opts.delete('Timeout') || '10s', # tcp connection timeout
    'DeregisterCriticalServiceAfter' => opts.delete('DeregisterCriticalServiceAfter')
  }
  
  if port = opts.delete(:http_port)
    params['HTTP'] = "http://#{$instance.ip_address(false)}:#{port}"
  elsif port = opts.delete(:tcp_port)
    params['TCP'] = "#{$instance.ip_address(false)}:#{port}"
  end
  
  unless opts.empty?
    raise "[register_service] unknown options: #{opts.keys.join(',')}"
  end
  
  $consul.register_service(name, $instance.ip_address(false), port, params)
end


def generate_file(template_path, output)
  merb = MERB.new
  out = merb.convert(template_path, output)
  # merb = MERB.new "The value of $x is: <%= $x -%>"
  # $x = 2.3
  # merb.run
  
  # File.open(output, 'w').write(out)
end

if ARGV.size != 1
  puts "Usage: $0 <script>"
  exit 1
end


def list_containers()
  ret = []
  clients = $docker_hosts.map do |arr|
    DockerClient.new(arr[0], $manager, arr[1])
  end
  
  clients.each do |d|
    d.list_containers().each do |c|
      # p [:GET, c.id]
      ret << d.get_container(c.id)
    end
  end
  
  ret
end

def docker_client(endpoint)
  DockerClient.new($manager, endpoint)
end


module TimerHandler
  REFRESH_TIMER = 2000
  
  def initialize(arg)
    set_timer(REFRESH_TIMER)
  end
  
  def timer
    Fiber.new do
      begin
        $containers = list_containers()
        $update_required_block.call()
      rescue => err
        p [:err, err]
      end
    end.resume
    
    true
  end
  
  def data_received(data)
    $read_connection.set_timer(REFRESH_TIMER)
  end
end

$read_connection = $manager.bind('udp://127.0.0.1:9999', TimerHandler)
$write_connection = $manager.connect('udp://127.0.0.1:9999')


puts "Container ID: #{myid}"
# myid = '3a374e6977677c69bcda2d6e7bd01f456a7e939f211f94d4d0217609a5970908'

Fiber.new do
  $containers = list_containers()
  # puts $containers.map(&:id).join("\n")
  $instance = $containers.detect do |d|
    d.id == myid
  end
  
  # load(ARGV[0])
  script = IO.read(ARGV[0])
  eval(script)
end.resume

MONITORED_EVENTS = [
  Docker::Action::ContainerStarted,
  Docker::Action::ContainerCreated,
  
  Docker::Action::ContainerStopped,
  Docker::Action::ContainerDied
]


dispatch_events = proc do |event_data|
  ev = Docker::Action.parse(event_data)
  # p ev
  if MONITORED_EVENTS.any?{|klass| ev.is_a?(klass) }
    Fiber.new do
      # begin
        # $containers = list_containers()
        $containers_change_block.call(ev)
        $write_connection.send_data('.')
      # rescue => err
      #   p [:fuck, err]
      # end
    end.resume
  end  
end

$docker_hosts.each do |arr|
  DockerEvents.new(arr[0], $manager, arr[1])
    .listen_to_events(&dispatch_events)
end

puts "Daemon started."
$manager.run()
