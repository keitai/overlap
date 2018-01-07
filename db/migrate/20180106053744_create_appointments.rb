class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.integer :session_length
      t.text :general_notes
      t.text :behavior_management_notes
      t.integer :behavior_management_score
      t.text :structured_lesson_notes
      t.integer :structured_lesson_score
      t.text :natural_environment_notes
      t.integer :natural_environment_score
      t.text :administrative_notes
      t.integer :administrative_score
      t.text :language_promotion_notes
      t.integer :language_promotion_score

      t.timestamps
    end
  end
end
