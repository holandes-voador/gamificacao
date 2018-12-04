class AddCostToReward < ActiveRecord::Migration[5.2]
  def change
    add_column :rewards, :cost, :float
  end
end
