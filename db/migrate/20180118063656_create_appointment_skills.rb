class CreateAppointmentSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :appointment_skills do |t|
      t.integer :skill_id
      t.integer :appointment_id
      t.integer :rating
      t.integer :position

      t.timestamps
    end
  end
end
