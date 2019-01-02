class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :cue
      t.integer :level
      t.references :user, foreign_key: true
      t.references :video, foreign_key: true

      t.timestamps
    end
  end
end
