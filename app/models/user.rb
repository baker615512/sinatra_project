class User < ActiveRecord::Base
    has_secure_password
    validates :email, uniqueness: true, presence: true
    has_many :board_games
end
