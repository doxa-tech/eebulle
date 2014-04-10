class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :content
      t.time :time

      t.timestamps
    end
  end
end
