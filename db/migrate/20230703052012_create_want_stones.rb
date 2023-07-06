class CreateWantStones < ActiveRecord::Migration[7.0]
  def change
    create_table :want_stones do |t|
      t.references :user, null: false, foreign_key: true
      t.references :power_stone, null: false, foreign_key: true

      t.timestamps
    end
    add_index :want_stones, [:user_id, :power_stone_id], unique: :true
  end
end
