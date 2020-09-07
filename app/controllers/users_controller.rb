class UsersController < ApplicationController

    def create
        user = User.new(user_params)
        if user.save
            render json: user.to_json()
        else
            render json: { message: "Invalid signup, please try again"}
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end