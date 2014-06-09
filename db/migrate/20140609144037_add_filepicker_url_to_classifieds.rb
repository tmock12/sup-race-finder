class AddFilepickerUrlToClassifieds < ActiveRecord::Migration
  def change
    add_column :classifieds, :filepicker_url, :string
  end
end
