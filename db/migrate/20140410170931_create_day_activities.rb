class CreateDayActivities < ActiveRecord::Migration[4.2]
  def change
    create_table :day_activities do |t|
      t.belongs_to :day, index: true
      t.belongs_to :activity, index: true

      t.timestamps
    end
  end
end
