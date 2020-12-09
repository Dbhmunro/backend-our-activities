class UsersController < ApplicationController

    def create
        user = User.new(user_params)
        if user.save
            token = encode_token({user_id: user.id})
            render json: {user: user, token: token}
        else
            render json: { message: "Invalid signup, please try again"}
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end