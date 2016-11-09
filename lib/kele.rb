require 'kele'
require "httparty"

class Kele
  include HTTParty

  def initialize(email, password)
    @base_api_endpoint = "https://www.bloc.io/api/v1"
    response = self.class.post(@base_api_endpoint + "/sessions", body: {
      email: email,
      password: password
    })

    @auth_token = response["auth_token"]
  end
end
