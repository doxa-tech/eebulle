class CreateRecurrenceActivities < ActiveRecord::Migration
  def change
    create_table :recurrence_activities do |t|
      t.belongs_to :recurrence, index: true
      t.belongs_to :activity, index: true

      t.timestamps
    end
  end
end
