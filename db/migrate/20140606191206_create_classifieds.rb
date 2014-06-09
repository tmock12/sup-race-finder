class CreateClassifieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.string :title
      t.string :price
      t.string :description
      t.string :city
      t.string :state
      t.string :country
      t.string :email

      t.timestamps
    end
  end
end
