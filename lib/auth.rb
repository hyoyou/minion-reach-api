require 'jwt'

class Auth
    def self.create_token(user_object)
        # binding.pry
        # user_object returns {:username=>"heather"}
        payload = { user: JSON.parse(user_object.to_json) }
        JWT.encode(payload, 'minions', 'HS256')
    end

    def self.decode_token(token)
        JWT.decode(token, 'minions', true, { :algorithm => 'HS256' })
    end
end