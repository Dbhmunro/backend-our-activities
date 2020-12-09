class ActivityUsersController < ApplicationController

    def index
        if params[:user_id] # needs to check for token and process it
            # decode token and set user_id = decoded_token[0]['user_id']
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

    def create
        activity_user = ActivityUser.new(activity_users_params)
        if activity_user.save
            render json: activity_user.to_json(:include => {
                :activity => {:include => [:category]}
            })
        else
            render json: { message: "Error with creating activity"}
        end
    end

    private

    def activity_users_params
        params.require(:activity_users).permit(:activity_id, :user_id, :start_date, :end_date) #will probably be token instead of userId
    end
end