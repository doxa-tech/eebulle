class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :file
      t.date :date
      t.string :speaker

      t.timestamps
    end
  end
end
