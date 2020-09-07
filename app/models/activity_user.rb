class ActivityUser < ApplicationRecord
    belongs_to :activity
    belongs_to :user

    def self.all_with_counts
        all_with_count = ActivityUser.all.map{|au| au.activity_id}
        # all_with_count = all_with_count.map{ |a| Activity.find(a).activity_name }
        all_with_count = all_with_count.group_by {|x| x}.map {|k,v| {id: k, activity_name: Activity.find(k).activity_name, used_count: v.count}}
        all_with_count
    end
    
    # activities_with_counts = Activity.all.map{ |a| a[:count_of_uses] = count[a.id] }
end
