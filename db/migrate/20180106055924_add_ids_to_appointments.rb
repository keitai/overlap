class AddIdsToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :therapist_id, :integer
    add_column :appointments, :user_id, :integer
  end
end
