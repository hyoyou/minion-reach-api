require 'jwt'

class Auth
    def self.create_token(user_object)
        # user_object returns {:id=>1, :username=>"heather", :score=>0}
        payload = { user: JSON.parse(user_object.to_json) }
        JWT.encode(payload, 'minions', 'HS256')
    end

    def self.decode_token(token)
        JWT.decode(token, 'minions', true, { :algorithm => 'HS256' })
    end
end