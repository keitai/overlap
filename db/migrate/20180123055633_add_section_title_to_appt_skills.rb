class AddSectionTitleToApptSkills < ActiveRecord::Migration[5.1]
  def change
    add_column :appointment_skills, :section_title, :string                
  end
end


