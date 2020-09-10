class ActivityUser < ApplicationRecord
    belongs_to :activity
    belongs_to :user

    def self.all_with_counts
        # get an array of activity ids from ActivityUsers
        all_with_count = ActivityUser.all.map{|au| au.activity_id}
        # group the array by activity id and then map id to associated activity name, category id, and count
        all_with_count = all_with_count.group_by {|x| x}.map {|k,v| {id: k, activity_name: Activity.find(k).activity_name, category_id: Activity.find(k).category_id, used_count: v.count}}
        all_with_count
    end
    
    # activities_with_counts = Activity.all.map{ |a| a[:count_of_uses] = count[a.id] }
end
