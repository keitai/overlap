class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :initials
      t.string :supervisor
      t.string :supervisor_email
      t.string :timezone

      t.timestamps
    end
  end
end
