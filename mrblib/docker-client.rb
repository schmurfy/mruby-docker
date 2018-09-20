class DockerClient < HTTPClient
  attr_reader :name
  attr_reader :containers
  
  def initialize(name, *args)
    super(*args)
    @name = name
    reset_cache()
  end
  
  def reset_cache
    @containers = {}
  end
  
  def list_containers
    req = get("/containers/json")
    if req.resp_code == 200
      data = JSON.parse(req.body)
      data.map do |dd|
        container = Docker::Object::Container.new(dd)
        @containers[container.id] = container
        container
      end
    else
      []
    end
  end
  
  def get_container(uid)
    req = get("/containers/#{uid}/json")
    if req.resp_code == 200
      data = JSON.parse(req.body)
      container = Docker::Object::Container.new(data)
      
      # update cache
      @containers[uid] = container
      
      container
    else
      nil
    end
  end
  
end
