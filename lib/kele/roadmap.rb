module Kele
  module Roadmap
    def get_roadmap
      roadmap_id = get_me["current_enrollment"]["roadmap_id"]

      response = self.class.get(
        @base_api_endpoint + "/roadmaps/#{ roadmap_id }",
        headers: { "authorization" => @auth_token }
      )
      JSON.parse(response.body)
    end

    def get_checkpoint
      checkpoint_id = get_roadmap["checkpoint_id"]

      response = self.class.get(
        @base_api_endpoint + ""
      )
    end
  end
end
