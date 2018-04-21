class DeleteDownloads < ActiveRecord::Migration[5.2]
  def change
    drop_table :downloads
  end
end
