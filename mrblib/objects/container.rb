####### LIST
# {
#     "Command": "/.r/r docker-entrypoint.sh agent -datacenter paris1 -server -retry-join consul-server-bootstrap -ui -client 0.0.0.0",
#     "Created": 1536761459,
#     "HostConfig": {
#         "NetworkMode": "none"
#     },
#     "Id": "cf6681d4382a99379e1d41de8121ffa3fdc3e2e995a000a2ee3d62f8dfb2005f",
#     "Image": "consul:latest",
#     "ImageID": "sha256:e5193fe01bbc3f497319898abdb121be690b403beef8e388a0fc43616e1b4189",
#     "Labels": {
#         "io.rancher.cni.network": "ipsec",
#         "io.rancher.cni.wait": "true",
#         "io.rancher.container.hostname_override": "container_name",
#         "io.rancher.container.ip": "10.42.140.35/16",
#         "io.rancher.container.mac_address": "02:98:8d:be:b7:fa",
#         "io.rancher.container.name": "consul-consul-server-2",
#         "io.rancher.container.uuid": "0be8a17a-077f-4379-9a0b-da6576a9b753",
#         "io.rancher.environment.uuid": "adminProject",
#         "io.rancher.project.name": "consul",
#         "io.rancher.project_service.name": "consul/consul-server",
#         "io.rancher.scheduler.global": "true",
#         "io.rancher.service.deployment.unit": "5e421795-5ef3-4832-9ec6-16b6afd1a8e3",
#         "io.rancher.service.hash": "e4b191c68f60060f8b32ac44cb4b228098eb976b",
#         "io.rancher.service.launch.config": "io.rancher.service.primary.launch.config",
#         "io.rancher.service.requested.host.id": "2",
#         "io.rancher.stack.name": "consul",
#         "io.rancher.stack_service.name": "consul/consul-server"
#     },
#     "Mounts": [
#         {
#             "Destination": "/.r",
#             "Driver": "local",
#             "Mode": "ro",
#             "Name": "rancher-cni",
#             "Propagation": "",
#             "RW": false,
#             "Source": "/mnt/pool1/docker/volumes/rancher-cni/_data",
#             "Type": "volume"
#         },
#         {
#             "Destination": "/consul/data",
#             "Driver": "local",
#             "Mode": "",
#             "Name": "c21dbe4bc305c4cdaec204944ac5530e6335ff2c7569f3143e7c021d4b117d37",
#             "Propagation": "",
#             "RW": true,
#             "Source": "",
#             "Type": "volume"
#         }
#     ],
#     "Names": [
#         "/r-consul-consul-server-2-0be8a17a"
#     ],
#     "NetworkSettings": {
#         "Networks": {
#             "none": {
#                 "Aliases": null,
#                 "DriverOpts": null,
#                 "EndpointID": "22119285095a0ce0b660cd4e1951f1e552be28de7a15bc8064066030edfdc3c0",
#                 "Gateway": "",
#                 "GlobalIPv6Address": "",
#                 "GlobalIPv6PrefixLen": 0,
#                 "IPAMConfig": null,
#                 "IPAddress": "",
#                 "IPPrefixLen": 0,
#                 "IPv6Gateway": "",
#                 "Links": null,
#                 "MacAddress": "",
#                 "NetworkID": "1b9528f841515c7243b0a6443ba2f0839028735d1da073d65d6e7b05d401668f"
#             }
#         }
#     },
#     "Ports": [],
#     "State": "running",
#     "Status": "Up About an hour"
# }


####### INSPECT
# {
#     "AppArmorProfile": "",
#     "Args": [
#         "docker-entrypoint.sh",
#         "agent",
#         "-datacenter",
#         "paris1",
#         "-server",
#         "-bootstrap-expect",
#         "3",
#         "-ui",
#         "-client",
#         "0.0.0.0"
#     ],
#     "Config": {
#         "AttachStderr": false,
#         "AttachStdin": false,
#         "AttachStdout": false,
#         "Cmd": [
#             "agent",
#             "-datacenter",
#             "paris1",
#             "-server",
#             "-bootstrap-expect",
#             "3",
#             "-ui",
#             "-client",
#             "0.0.0.0"
#         ],
#         "Domainname": "",
#         "Entrypoint": [
#             "/.r/r",
#             "docker-entrypoint.sh"
#         ],
#         "Env": [
#             "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
#             "CONSUL_VERSION=1.1.0",
#             "HASHICORP_RELEASES=https://releases.hashicorp.com"
#         ],
#         "ExposedPorts": {
#             "8300/tcp": {},
#             "8301/tcp": {},
#             "8301/udp": {},
#             "8302/tcp": {},
#             "8302/udp": {},
#             "8500/tcp": {},
#             "8600/tcp": {},
#             "8600/udp": {}
#         },
#         "Healthcheck": {},
#         "Hostname": "consul-server-bootstrap",
#         "Image": "consul:latest",
#         "Labels": {
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
#             "io.rancher.stack_service.name": "consul/consul-server-bootstrap"
#         },
#         "OnBuild": null,
#         "OpenStdin": false,
#         "StdinOnce": false,
#         "Tty": false,
#         "User": "",
#         "Volumes": {
#             "/consul/data": {}
#         },
#         "WorkingDir": ""
#     },
#     "Created": "2018-09-06T09:40:48.135668012Z",
#     "Driver": "zfs",
#     "ExecIDs": null,
#     "GraphDriver": {
#         "Data": {
#             "Dataset": "pool1/docker/bedeb4ebdf6f368324805100583abf4b0abfaac17b764944ab15c1e3f6262c36",
#             "Mountpoint": "/mnt/pool1/docker/zfs/graph/bedeb4ebdf6f368324805100583abf4b0abfaac17b764944ab15c1e3f6262c36"
#         },
#         "Name": "zfs"
#     },
#     "HostConfig": {
#         "AutoRemove": false,
#         "Binds": [
#             "rancher-cni:/.r:ro"
#         ],
#         "BlkioDeviceReadBps": null,
#         "BlkioDeviceReadIOps": null,
#         "BlkioDeviceWriteBps": null,
#         "BlkioDeviceWriteIOps": null,
#         "BlkioWeight": 0,
#         "BlkioWeightDevice": null,
#         "CapAdd": null,
#         "CapDrop": null,
#         "Cgroup": "",
#         "CgroupParent": "",
#         "ConsoleSize": [
#             0,
#             0
#         ],
#         "ContainerIDFile": "",
#         "CpuCount": 0,
#         "CpuPercent": 0,
#         "CpuPeriod": 0,
#         "CpuQuota": 0,
#         "CpuRealtimePeriod": 0,
#         "CpuRealtimeRuntime": 0,
#         "CpuShares": 2,
#         "CpusetCpus": "",
#         "CpusetMems": "",
#         "DeviceCgroupRules": null,
#         "Devices": [],
#         "DiskQuota": 0,
#         "Dns": [
#             "169.254.169.250"
#         ],
#         "DnsOptions": [],
#         "DnsSearch": [
#             "consul.rancher.internal",
#             "consul-server-bootstrap.consul.rancher.internal",
#             "rancher.internal"
#         ],
#         "ExtraHosts": null,
#         "GroupAdd": null,
#         "IOMaximumBandwidth": 0,
#         "IOMaximumIOps": 0,
#         "Init": false,
#         "IpcMode": "shareable",
#         "Isolation": "",
#         "KernelMemory": 0,
#         "Links": null,
#         "LogConfig": {
#             "Config": {
#                 "max-file": "2",
#                 "max-size": "25m"
#             },
#             "Type": "json-file"
#         },
#         "Memory": 0,
#         "MemoryReservation": 0,
#         "MemorySwap": 0,
#         "MemorySwappiness": null,
#         "NanoCpus": 0,
#         "NetworkMode": "none",
#         "OomKillDisable": false,
#         "OomScoreAdj": 0,
#         "PidMode": "",
#         "PidsLimit": 0,
#         "PortBindings": {},
#         "Privileged": false,
#         "PublishAllPorts": false,
#         "ReadonlyRootfs": false,
#         "RestartPolicy": {
#             "MaximumRetryCount": 0,
#             "Name": ""
#         },
#         "Runtime": "runc",
#         "SecurityOpt": null,
#         "ShmSize": 67108864,
#         "UTSMode": "",
#         "Ulimits": null,
#         "UsernsMode": "",
#         "VolumeDriver": "",
#         "VolumesFrom": null
#     },
#     "HostnamePath": "/mnt/pool1/docker/containers/c706355aedd5197b689430d0bf01a55cf6fc53d6cb41a37edf1412ed54eed98d/hostname",
#     "HostsPath": "/mnt/pool1/docker/containers/c706355aedd5197b689430d0bf01a55cf6fc53d6cb41a37edf1412ed54eed98d/hosts",
#     "Id": "c706355aedd5197b689430d0bf01a55cf6fc53d6cb41a37edf1412ed54eed98d",
#     "Image": "sha256:e5193fe01bbc3f497319898abdb121be690b403beef8e388a0fc43616e1b4189",
#     "LogPath": "/mnt/pool1/docker/containers/c706355aedd5197b689430d0bf01a55cf6fc53d6cb41a37edf1412ed54eed98d/c706355aedd5197b689430d0bf01a55cf6fc53d6cb41a37edf1412ed54eed98d-json.log",
#     "MountLabel": "",
#     "Mounts": [
#         {
#             "Destination": "/.r",
#             "Driver": "local",
#             "Mode": "ro",
#             "Name": "rancher-cni",
#             "Propagation": "",
#             "RW": false,
#             "Source": "/mnt/pool1/docker/volumes/rancher-cni/_data",
#             "Type": "volume"
#         },
#         {
#             "Destination": "/consul/data",
#             "Driver": "local",
#             "Mode": "",
#             "Name": "298130828a79eb0eca4b8da1f1aa32a50cb53a942de1cfacf54b634ff7ada8b7",
#             "Propagation": "",
#             "RW": true,
#             "Source": "/mnt/pool1/docker/volumes/298130828a79eb0eca4b8da1f1aa32a50cb53a942de1cfacf54b634ff7ada8b7/_data",
#             "Type": "volume"
#         }
#     ],
#     "Name": "/r-consul-consul-server-bootstrap-1-db86651c",
#     "NetworkSettings": {
#         "Bridge": "",
#         "EndpointID": "",
#         "Gateway": "",
#         "GlobalIPv6Address": "",
#         "GlobalIPv6PrefixLen": 0,
#         "HairpinMode": false,
#         "IPAddress": "",
#         "IPPrefixLen": 0,
#         "IPv6Gateway": "",
#         "LinkLocalIPv6Address": "",
#         "LinkLocalIPv6PrefixLen": 0,
#         "MacAddress": "",
#         "Networks": {
#             "none": {
#                 "Aliases": null,
#                 "DriverOpts": null,
#                 "EndpointID": "bc3cec458a780f0ede896534e988cd8c8fe91276f11121e0068c07d10fc1b4a5",
#                 "Gateway": "",
#                 "GlobalIPv6Address": "",
#                 "GlobalIPv6PrefixLen": 0,
#                 "IPAMConfig": null,
#                 "IPAddress": "",
#                 "IPPrefixLen": 0,
#                 "IPv6Gateway": "",
#                 "Links": null,
#                 "MacAddress": "",
#                 "NetworkID": "1b9528f841515c7243b0a6443ba2f0839028735d1da073d65d6e7b05d401668f"
#             }
#         },
#         "Ports": {},
#         "SandboxID": "7c0e5fe9b82f4561da434121a125b83aa0ce53ba4a91ac4fef4602db520866ae",
#         "SandboxKey": "/var/run/docker/netns/7c0e5fe9b82f",
#         "SecondaryIPAddresses": null,
#         "SecondaryIPv6Addresses": null
#     },
#     "Path": "/.r/r",
#     "Platform": "linux",
#     "ProcessLabel": "",
#     "ResolvConfPath": "/mnt/pool1/docker/containers/c706355aedd5197b689430d0bf01a55cf6fc53d6cb41a37edf1412ed54eed98d/resolv.conf",
#     "RestartCount": 0,
#     "State": {
#         "Dead": false,
#         "Error": "",
#         "ExitCode": 0,
#         "FinishedAt": "2018-09-12T08:45:04.066295949Z",
#         "OOMKilled": false,
#         "Paused": false,
#         "Pid": 12606,
#         "Restarting": false,
#         "Running": true,
#         "StartedAt": "2018-09-12T08:45:05.985833736Z",
#         "Status": "running"
#     }
# }

class Docker::Object::Container
  
  class Mount
    attr_reader :destination, :source, :driver, :rw
    
    def initialize(data = {})
      @source       = data['Source']
      @destination  = data['Destination']
      @driver       = data['Driver']
      @rw           = data['RW']
    end
  end
  
  attr_reader :command, :created_at, :id, :mounts, :labels, :env, :name
  attr_reader :exposed_ports, :ports
  
  def initialize(data = {})
    @id             = data['Id']
    @created_at     = data['Created']
    @mounts         = data['Mounts'].map{|m| Mount.new(m)}
    @exposed_ports  = []
    @env = {}
    
    if data['Args'] # inspect
      @name         = data['Name'].split('/')
      @command      = data['Args'].join(' ')
      @labels       = data['Config']['Labels']
      @ports        = data['NetworkSettings']['Ports']
      data['Config']['Env'].each do |line|
        key, value = line.split('=')
        @env[key] = value
      end
      
      @exposed_ports  = data['Config']['ExposedPorts']
      
    else # list
      @command      = data['Command']
      @labels       = data['Labels']
      @ports        = data['Ports']
      @name         = data['Names'][0]
      
    end
  end
  
  def ip_address(include_mask = true)
    if @labels.has_key?("io.rancher.container.ip")
      if include_mask
        @labels["io.rancher.container.ip"]
      else
        @labels["io.rancher.container.ip"].split('/')[0]
      end
      
    else
      nil
    end
  end
  
  def system?
    @labels.has_key?('io.rancher.container.system') &&
      @labels['io.rancher.container.system']
  end
  
  def service_name
    @labels['io.rancher.stack_service.name']
  end
  
end
