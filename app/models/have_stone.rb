class HaveStone < ApplicationRecord
  belongs_to :user
  belongs_to :power_stone, class_name: "PowerStone"
  validates :user_id, uniqueness: { scope: :power_stone_id}
end
