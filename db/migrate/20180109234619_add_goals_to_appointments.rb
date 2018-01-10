class AddGoalsToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :goals, :text
  end
end
