
module HTTPClientHandler
  def initialize(client)
    @client = client
  end
  
  def http_reply(req)
    if @client.waiting_fiber
      @client.waiting_fiber.resume(req)
    end
  end
  
  def http_chunk(req)
    @client.chunk_received(req)
  end
end

class HTTPClient
  attr_reader :waiting_fiber
  
  def initialize(manager, connection_string)
    @manager = manager
    @connection = manager.connect(connection_string, HTTPClientHandler, self)
      .set_protocol_http_websocket()
  end
  
  def get(url, sync = true)
    @waiting_fiber = Fiber.current
    send_request(url)
    Fiber.yield if sync
  end
  
  def put(url, body)
    @waiting_fiber = Fiber.current
    send_request(url, 'PUT', body)
    Fiber.yield
  end
  
  def send_request(path, verb = 'GET', body = nil)
    data = [
      "#{verb} #{path} HTTP/1.1",
      'Host: 127.0.0.1',
    ]
    
    if verb == 'PUT'
      data << 'Content-Type: application/json'
    end
    
    if body
      data << "Content-Length: #{body.size}"
      data << ''
      data << body
    else
      data << ''
      data << ''
    end
    
    @connection.send_data(data.join("\r\n"))
  end
  
  def chunk_received(req)
    
  end
end
