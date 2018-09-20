# {
#     "Action": "stop|start|die|kill",
#     "status": "stop|start|die|kill",
#     "Actor": {
#         "Attributes": {
#             "image": "consul:latest",
#             "io.rancher.cni.network": "ipsec",
#             "io.rancher.cni.wait": "true",
#             "io.rancher.container.ip": "10.42.93.88/16",
#             "io.rancher.container.mac_address": "02:98:8d:de:7c:c7",
#             "io.rancher.container.name": "consul-consul-server-bootstrap-1",
#             "io.rancher.container.uuid": "db86651c-bba1-4001-acce-06d932ac9078",
#             "io.rancher.environment.uuid": "adminProject",
#             "io.rancher.project.name": "consul",
#             "io.rancher.project_service.name": "consul/consul-server-bootstrap",
#             "io.rancher.scheduler.affinity:host_label": "name=rancher1",
#             "io.rancher.service.deployment.unit": "dd9184e2-f68b-4368-8e6c-34073b2e7425",
#             "io.rancher.service.hash": "99d2721c1035886a9de73078986aa0094de50ee1",
#             "io.rancher.service.launch.config": "io.rancher.service.primary.launch.config",
#             "io.rancher.stack.name": "consul",
#             "io.rancher.stack_service.name": "consul/consul-server-bootstrap",
#             "name": "r-consul-consul-server-bootstrap-1-db86651c"
#         },
#         "ID": "c706355aedd5197b689430d0bf01a55cf6fc53d6cb41a37edf1412ed54eed98d"
#     },
#     "Type": "container",
#     "from": "consul:latest",
#     "id": "c706355aedd5197b689430d0bf01a55cf6fc53d6cb41a37edf1412ed54eed98d",
#     "scope": "local",
#     "time": 1536677907,
#     "timeNano": 1536677907162943561
# }
module Docker::Action
  class ContainerEvent < Event
    def service_name
      @actor.attributes['io.rancher.stack_service.name']
    end
  end
  
  class ContainerExecCreate < ContainerEvent
    # exec_create
  end
  
  class ContainerExecStart < ContainerEvent
    # exec_start
  end
  
  class ContainerExecDie < ContainerEvent
    # exec_die
  end
  
  class ContainerCreated < ContainerEvent
    # create
  end
  
  class ContainerDestroyed < ContainerEvent
    # destroy
  end
  
  class ContainerStarted < ContainerEvent
    # start
  end
  
  # {
  #   "Action": "attach",
  #   "Actor": {
  #       "Attributes": {
  #           "image": "alpine",
  #           "name": "infallible_edison"
  #       },
  #       "ID": "994c1050a1f3aead1bbefbbd2c3fcdc7e803fb5d4b156607be29fe5292be68b5"
  #   },
  #   "Type": "container",
  #   "from": "alpine",
  #   "id": "994c1050a1f3aead1bbefbbd2c3fcdc7e803fb5d4b156607be29fe5292be68b5",
  #   "scope": "local",
  #   "status": "attach",
  #   "time": 1537197735,
  #   "timeNano": 1537197735912864559
  # }
  class ContainerAttached < ContainerEvent
    # attach
  end
  
  class ContainerResized < ContainerEvent
    # resize
  end
  
  class ContainerStopped < ContainerEvent
    # stop
  end
  
  class ContainerKilled < ContainerEvent
    # kill
  end
  
  class ContainerDied < ContainerEvent
    # die
  end
  
  def self.parse_container_event(ev)
    case ev['Action']
    when 'resize'         then ContainerResized.new(ev)
    when 'attach'         then ContainerAttached.new(ev)
    when 'destroy'        then ContainerDestroyed.new(ev)
    when 'create'         then ContainerCreated.new(ev)
    when 'start'          then ContainerStarted.new(ev)
    when 'stop'           then ContainerStopped.new(ev)
    when 'die'            then ContainerDied.new(ev)
    when 'kill'           then ContainerKilled.new(ev)
    when /^exec_create: / then ContainerExecCreate.new(ev)
    when /^exec_start: /  then ContainerExecStart.new(ev)
    when 'exec_die'       then ContainerExecDie.new(ev)
    else
      p ev
      puts "unknown container action #{ev['Action']}"
    end
  end
end

