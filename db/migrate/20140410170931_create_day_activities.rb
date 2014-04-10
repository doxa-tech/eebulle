class CreateDayActivities < ActiveRecord::Migration
  def change
    create_table :day_activities do |t|
      t.belongs_to :day, index: true
      t.belongs_to :activity, index: true

      t.timestamps
    end
  end
end
