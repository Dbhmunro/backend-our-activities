class CreateActivityUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_users do |t|
      t.integer :activity_id
      t.integer :user_id
      t.datetime :start_date
      t.datetime :end_date
      
      t.timestamps
    end
  end
end
