class ActivityUsersController < ApplicationController

    def index
        activities_with_counts = ActivityUser.all_with_counts
        render json: activities_with_counts.to_json()
    end

    def show
    end

    def create
    end
end