require 'jwt'

class Auth
    def self.create_token(user_object)
        # binding.pry
        # user_object returns {:id=>13, :username=>"philtheminion", :score=>0}
        payload = { user: JSON.parse(user_object.to_json) }
        JWT.encode(payload, 'minions', 'HS256')
    end

    def self.decode_token(token)
        JWT.decode(token, 'minions', true, { :algorithm => 'HS256' })
    end
end