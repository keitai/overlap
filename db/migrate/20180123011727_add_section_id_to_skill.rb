class AddSectionIdToSkill < ActiveRecord::Migration[5.1]
  def change
    add_column :skills, :section_id, :integer        
  end
end
