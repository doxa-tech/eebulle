class CreateDownloads < ActiveRecord::Migration
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
