class AddEmailToRace < ActiveRecord::Migration
  def change
    add_column :races, :email, :string
  end
end
