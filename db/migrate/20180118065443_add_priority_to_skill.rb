class AddPriorityToSkill < ActiveRecord::Migration[5.1]
  def change
    add_column :skills, :priority, :integer
  end
end
