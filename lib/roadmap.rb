require 'httparty'
require 'json'

module RoadMap
    include HTTParty
    
    def get_roadmap
        response = self.class.get("#{@base_uri}/roadmaps/37", headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end
    
    def get_checkpoint
        response = self.class.get("#{@base_uri}/checkpoints/2260", headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end
end