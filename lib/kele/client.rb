module Kele
  class Client
    include HTTParty
    include Kele::Roadmap

    def initialize(email, password)
      @email = email
      @base_api_endpoint = "https://www.bloc.io/api/v1"
      response = self.class.post(@base_api_endpoint + "/sessions", body: {
        email: email,
        password: password
      })

      @auth_token = response["auth_token"]
    end

    def get_me
      response = self.class.get(
        @base_api_endpoint + "/users/me",
        headers: { "authorization" => @auth_token }
      )
      JSON.parse(response.body)
    end

    def get_mentor_availability()
      mentor_id = get_me["current_enrollment"]["mentor_id"]

      response = self.class.get(
        @base_api_endpoint + "/mentors/#{ mentor_id }/student_availability",
        headers: { "authorization" => @auth_token }
      )
      JSON.parse(response.body)
    end

    def get_messages
      response = self.class.get(
        @base_api_endpoint + "/message_threads",
        headers: { "authorization" => @auth_token }
      )
      JSON.parse(response.body)
    end

    def create_message(subject, stripped_text)
      sender = @email
      recipient_id = get_me["current_enrollment"]["mentor_id"]
      #stripped_text = ?
      response = self.class.post(
        @base_api_endpoint + "/messages",
        headers: { "authorization" => @auth_token },
        body: {
          "sender" => sender,
          "recipient_id" => recipient_id,
          "subject" => subject,
          "stripped-text" => stripped_text
        }
      )
      response
    end

    def create_submission(checkpoint_id, assignment_branch, assignment_commit_link, comment)
      
    end

    end
  end
end
