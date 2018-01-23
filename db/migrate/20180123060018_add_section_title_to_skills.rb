class AddSectionTitleToSkills < ActiveRecord::Migration[5.1]
  def change
    add_column :skills, :section_title, :string                    
  end
end
