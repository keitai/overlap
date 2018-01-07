class AddLocationToTherapists < ActiveRecord::Migration[5.1]
  def change
    add_column :therapists, :location, :string
  end
end
