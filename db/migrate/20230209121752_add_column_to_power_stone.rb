class AddColumnToPowerStone < ActiveRecord::Migration[7.0]
  def change
    add_column :power_stones, :power_stone_image, :string
  end
end
