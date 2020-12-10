class SessionsController < ApplicationController

    def create
        # byebug
        if !!params[:user][:email]
            user = User.find_by(email: params[:user][:email])
            if !!user
                if user.authenticate(params[:user][:password])
                    token = encode_token({user_id: user.id})
                    render json: {user: user, token: token}
                else
                    render json: { message: "Invalid login, please try again"}
                end
            else
                render json: { message: "User not found, please try again"}
            end
        elsif !!params[:user][:token] #will likely be recieving token here and need to decode it for userId
            logged_in?
            # user = User.find_by(id: params[:user][:id])
            token = encode_token({user_id: user.id})
            render json: {user: user, token: token}
            #would be good to add conditional in case token is no longer valid, so that the token can be deleted from localstorage
        end

    end

end