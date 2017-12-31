require 'httparty'
require './lib/roadmap'



class Kele
    include HTTParty
    include Roadmap
    
    def initialize(email, password)
         @base_uri = "https://www.bloc.io/api/v1"        
         response = self.class.post("#{@base_uri}/sessions", body: {"email": email, "password": password})
         @auth_token = response["auth_token"]
    end
    
    def get_me
       response = self.class.get("#{@base_uri}/users/me", headers: { "authorization" => @auth_token })
       JSON.parse(response.body)
    end
    
    def get_mentor_availability(mentor_id)
        response = self.class.get("#{@base_uri}/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end
    
    def get_messages
        response = self.class.get("#{@base_uri}/message_threads", headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end
    
    def create_message
       response = self.class.post("#{@base_uri}/messages", body: {"sender": "siscely.george@gmail.com","recipient_id": 539470, "token": "", "subject": "Message checkpoint", "stripped-text": "Learning to create messages"}, headers: { "authorization" => @auth_token }) 
    
      JSON.parse(response.body)
    end
    
    def create_submission
        response = self.class.post("#{@base_uri}/checkpoint_submissions", body: {"checkpoint_id": "2555","comment": "submitting via kele"}, headers: { "authorization" => @auth_token }) 
        JSON.parse(response.body)
    end
end