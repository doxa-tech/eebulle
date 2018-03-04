class CreateEvents < ActiveRecord::Migration[4.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :content
      t.integer :duration
      t.datetime :date

      t.timestamps
    end
  end
end
