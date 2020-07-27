class BoardGame < ActiveRecord::Base
    belongs_to :user
    validates :game_name, presence: true
end
