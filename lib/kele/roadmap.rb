module Kele
  module Roadmap
    def get_roadmap(id)
      response = self.class.get(
        @base_api_endpoint + "/roadmaps/#{ id }",
        headers: { "authorization" => @auth_token }
      )
      
      JSON.parse(response.body)
    end

    def get_checkpoint(id)
      response = self.class.get(
        @base_api_endpoint + "/checkpoints/#{ id }",
        headers: { "authorization" => @auth_token }
      )

      JSON.parse(response.body)
    end
  end
end
