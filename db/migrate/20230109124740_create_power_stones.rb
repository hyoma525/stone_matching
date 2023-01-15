class CreatePowerStones < ActiveRecord::Migration[7.0]
  def change
    create_table :power_stones do |t|
      t.string :name
      t.text :overview

      t.timestamps
    end
  end
end
