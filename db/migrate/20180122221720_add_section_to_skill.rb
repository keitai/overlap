class AddSectionToSkill < ActiveRecord::Migration[5.1]
  def change
    add_column :skills, :section, :integer    
  end
end
