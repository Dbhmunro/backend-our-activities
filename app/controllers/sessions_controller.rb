class SessionsController < ApplicationController

    # def index
    #     user = User.find(1)
    #     render json: user.to_json()
    # end


    def create
        # byebug
        if !!params[:user][:email]
            user = User.find_by(email: params[:user][:email])
            if !!user
                if user.authenticate(params[:user][:password])
                    render json: user.to_json()
                else
                    render json: { message: "Invalid login, please try again"}
                end
            else
                render json: { message: "User not found, please try again"}
            end
        elsif !!params[:user][:id]
            user = User.find_by(id: params[:user][:id])
            render json: user.to_json()
        end

    end

end