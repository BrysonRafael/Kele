require 'kele'

class Client
  include HTTParty

  def initialize(email, password)
    response = self.class.post(base_api_endpoint + "/sessions", body: {
      email: email,
      password: password
    })

    @auth_token = response["auth_token"]
  end
end
