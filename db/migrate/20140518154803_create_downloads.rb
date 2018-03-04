class CreateDownloads < ActiveRecord::Migration[4.2]
  def change
    create_table :downloads do |t|
      t.string :name
      t.string :file
      t.string :extension
      t.integer :size

      t.timestamps
    end
  end
end
