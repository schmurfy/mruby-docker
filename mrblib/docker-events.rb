module DockerEventsHandler
  def initialize(client)
    @buffer = ""
    
    @parser = HTTP::ChunkParser.new do |body|
      @buffer << body
      
      # puts "***"
      # puts @buffer
      
      begin
        json = JSON.parse(@buffer)
        @client.event_received(json)
        @buffer = ""
      rescue JSON::ParserError
        # p @buffer
      end
    end
    
    @client = client
  end
  
  def data_received(data)
    @parser.execute(data)
    # @client.data_received(data)
  end
end

class DockerEvents < HTTPClient
  attr_reader :name
  
  def initialize(name, manager, connection_string)
    @name = name
    @manager = manager
    @connection = manager.connect(connection_string, DockerEventsHandler, self)
    @buffer = ""
    @current_message = ""
  end
  
  def listen_to_events(&block)
    get('/events', false)
    @block = block
  end
  
  SIZE_REG = Regexp.new("^([0-9a-f]+)\r\n(.*)")
  SEPARATOR = "\r\n"
  
  def event_received(event_data)
    @block.call(event_data)
  end
  
end
