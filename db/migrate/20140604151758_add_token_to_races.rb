class AddTokenToRaces < ActiveRecord::Migration
  def change
    add_column :races, :token, :string
  end
end
