# {
#     "Action": "mount|unmount",
#     "Actor": {
#         "Attributes": {
#             "container": "c706355aedd5197b689430d0bf01a55cf6fc53d6cb41a37edf1412ed54eed98d",
#             "destination": "/consul/data",
#             "driver": "local",
#             "propagation": "",
#             "read/write": "true"
#         },
#         "ID": "298130828a79eb0eca4b8da1f1aa32a50cb53a942de1cfacf54b634ff7ada8b7"
#     },
#     "Type": "volume",
#     "scope": "local",
#     "time": 1536677908,
#     "timeNano": 1536677908026296372
# }
module Docker::Action
  class VolumeMounted < Event
    # mount
  end
  
  class VolumeUnmounted < Event
    # unmount
  end
  
  class VolumeDestroyed < Event
    # destroy
  end
  
  def self.parse_volume_event(ev)
    case ev['Action']
    when 'mount'      then VolumeMounted.new(ev)
    when 'unmount'    then VolumeUnmounted.new(ev)
    when 'destroyed'  then VolumeDestroyed.new(ev)
    else
      p ev
      puts "unknown volume action #{ev['Action']}"
    end
  end

end
