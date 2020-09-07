class User < ApplicationRecord
    has_many :activity_users
    has_many :activities, through: :activity_users

    validates_presence_of :username, :email
    validates :email, uniqueness: true

    has_secure_password
end
