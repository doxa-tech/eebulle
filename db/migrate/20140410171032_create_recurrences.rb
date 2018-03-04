class CreateRecurrences < ActiveRecord::Migration[4.2]
  def change
    create_table :recurrences do |t|
      t.string :name

      t.timestamps
    end
  end
end
