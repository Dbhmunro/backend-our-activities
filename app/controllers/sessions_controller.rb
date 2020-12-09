class SessionsController < ApplicationController

    def create
        # byebug
        if !!params[:user][:email]
            user = User.find_by(email: params[:user][:email])
            if !!user
                if user.authenticate(params[:user][:password])
                    #need to generate token here
                    render json: user.to_json() #need to render user and token here
                else
                    render json: { message: "Invalid login, please try again"}
                end
            else
                render json: { message: "User not found, please try again"}
            end
        elsif !!params[:user][:id] #will be recieving token here
            user = User.find_by(id: params[:user][:id])
            render json: user.to_json() #need to render user and token here
            #would be good to add conditional in case token is no longer valid so that the token can be deleted from localstorage
        end

    end

end