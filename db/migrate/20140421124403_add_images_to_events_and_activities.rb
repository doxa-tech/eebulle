class AddImagesToEventsAndActivities < ActiveRecord::Migration[4.2]
  def change
  	add_column :events, :image, :string
  	add_column :activities, :image, :string
  end
end
