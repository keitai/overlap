class RemoveSectionFromSkills < ActiveRecord::Migration[5.1]
  def change
    remove_column :skills, :section    
  end
end
