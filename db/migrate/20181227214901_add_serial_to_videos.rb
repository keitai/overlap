class AddSerialToVideos < ActiveRecord::Migration[5.1]
  def change
      add_column :videos, :serial, :integer                    
  end
end