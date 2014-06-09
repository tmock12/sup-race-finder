class ChangeClassifiedsDescriptionFromStringToText < ActiveRecord::Migration
  def up
     change_column :classifieds, :description, :text
  end

  def down
     change_column :classifieds, :description, :string
  end
end
