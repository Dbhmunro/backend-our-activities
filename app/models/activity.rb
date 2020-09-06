class Activity < ApplicationRecord
    belongs_to :category
    has_many :activity_users
    has_many :users, through: :activity_users
end
