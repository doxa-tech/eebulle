class AddImagesToEventsAndActivities < ActiveRecord::Migration
  def change
  	add_column :events, :image, :string
  	add_column :activities, :image, :string
  end
end
