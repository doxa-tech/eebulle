class CreateActivities < ActiveRecord::Migration[4.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :content
      t.time :time
      t.boolean :main
      t.belongs_to :recurrence, index: true

      t.timestamps
    end
  end
end
