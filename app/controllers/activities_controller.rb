class ActivitiesController < ApplicationController
    
    def index
        activities = Activity.all
        render json: activities.to_json()
    end

    def create
        activity = Activity.new(activity_params)
        if activity.save
            render json: activity.to_json()
        else
            render json: { message: "Error with creating activity"}
        end
    end

    private

    def activity_params
        params.require(:activity).permit(:activity_name, :category_id, :outdoor)
    end

end