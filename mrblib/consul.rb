class Consul < HTTPClient
  
  def register_service(name, address, port, check = {})
    body = JSON.dump({
      "Name"    => name,
      "Address" => address,
      "Port"    => port,
      "Tags"    => ["web"],
      "Check"   => check
    })
    
    put('/v1/agent/service/register', body)
  end
end
