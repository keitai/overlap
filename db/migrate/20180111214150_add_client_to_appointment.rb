class AddClientToAppointment < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :client_id, :integer
  end
end
