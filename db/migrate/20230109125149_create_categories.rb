class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :color
      t.string :effect
      t.string :price
      t.string :rare

      t.timestamps
    end
  end
end
