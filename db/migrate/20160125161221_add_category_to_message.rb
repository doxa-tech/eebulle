class AddCategoryToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :category, :integer, default: 0
  end
end
