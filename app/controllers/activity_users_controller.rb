class ActivityUsersController < ApplicationController

    def index
        if params[:user_id]
            user_activities = ActivityUser.select { |au| au.user_id == params[:user_id].to_i }
            # render json: user_activities.to_json(include: [:activity])
            render json: user_activities.to_json(:include => {
                :activity => {:include => [:category]}
            })
        else
            activities_with_counts = ActivityUser.all_with_counts
            render json: activities_with_counts.to_json()
        end
    end

    def show
    end

    def create
    end
end