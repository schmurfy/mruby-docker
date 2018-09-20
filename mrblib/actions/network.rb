# {
#     "Action": "connect|disconnect",
#     "Actor": {
#         "Attributes": {
#             "container": "c706355aedd5197b689430d0bf01a55cf6fc53d6cb41a37edf1412ed54eed98d",
#             "name": "none",
#             "type": "null"
#         },
#         "ID": "1b9528f841515c7243b0a6443ba2f0839028735d1da073d65d6e7b05d401668f"
#     },
#     "Type": "network",
#     "scope": "local",
#     "time": 1536677907,
#     "timeNano": 1536677907956154848
# }
module Docker::Action
  class NetworkConnected < Event
    # connect
  end
  
  class NetworkDisconnected < Event
    # disconnect
  end
  
  def self.parse_network_event(ev)
    case ev['Action']
    when 'connect'    then NetworkConnected.new(ev)
    when 'disconnect' then NetworkDisconnected.new(ev)
    else
      p ev
      puts "unknown network action #{ev['Action']}"
    end
  end
end
