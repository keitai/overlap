class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.text :body
      t.integer :status
      t.integer :therapist_id
      t.integer :user_id

      t.timestamps
    end
  end
end
