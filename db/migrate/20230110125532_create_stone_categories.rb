class CreateStoneCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :stone_categories do |t|
      t.references :power_stone, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
