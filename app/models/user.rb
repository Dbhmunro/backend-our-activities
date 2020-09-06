class User < ApplicationRecord
    has_many :activity_users
    has_many :activities, through: :activity_users

    has_secure_password
end
