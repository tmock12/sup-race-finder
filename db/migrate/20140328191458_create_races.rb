class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.datetime :date
      t.string :street
      t.string :city
      t.string :state
      t.string :country, default: 'USA'
      t.string :zip
      t.string :title
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
