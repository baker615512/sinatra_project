class User < ActiveRecord::Base
    has_secure_password
    valitdates :email, uniqueness: true
end
