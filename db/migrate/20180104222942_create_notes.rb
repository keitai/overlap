class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.text :body
      t.integer :user_id
      t.integer :therapist_id

      t.timestamps
    end
  end
end
