class AddActiveToRaces < ActiveRecord::Migration
  def change
    add_column :races, :active, :boolean, default: false
    Race.update_all(active: true)
  end
end
