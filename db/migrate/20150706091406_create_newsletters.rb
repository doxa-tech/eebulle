class CreateNewsletters < ActiveRecord::Migration[4.2]
  def change
    create_table :newsletters do |t|
      t.string :subject
      t.string :title
      t.string :subtitle
      t.text :content
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
