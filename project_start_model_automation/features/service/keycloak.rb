class GetToken
  
  include HTTParty
  base_uri($env['keycloak'])
  default_options.update(verify: false) #para ignorar o erro de SSL

  def authenticate
    @auth = {    
    'username': ($auth['keycloak']['username']),
    'password': ($auth['keycloak']['password']),
    'grant_type': ($auth['keycloak']['grant_type']),
    'client_id': ($auth['keycloak']['client_id']) }

    @response = self.class.post('/', body: @auth)
    @@token = @response['access_token']
    # Kernel.puts ($token).green
  end
end
