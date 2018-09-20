module Docker
  module Object
    
  end
  
  module Action
    
    class EventActor
      attr_accessor :attributes, :id
      
      def initialize(data = {})
        @id = data['ID']
        @attributes = data['Attributes']
      end
    end
    
    class Event
      attr_accessor :action, :type, :actor, :scope, :time
      
      def initialize(data = {})
        @action = data['Action']
        @type = data['Type']
        @scope = data['scope']
        @time = data['time']
        
        if data.has_key?('Actor')
          @actor = EventActor.new(data['Actor'])
        end
      end
      
      def target_id
        if @actor
          @actor.id
        end
      end
    end
    
    
    def self.parse(data)
      unless data.is_a?(Hash)
        p [:invalid_data, data]
        return
      end
      
      case data['Type']
      when 'container' then parse_container_event(data)
      when 'network' then parse_network_event(data)
      when 'volume' then parse_volume_event(data)
      else
        raise "unknown type #{data['Type']}"
      end
      
    # rescue => err
    #   p data
    #   raise
    end
  end
end
