class PowerStone < ApplicationRecord
  mount_uploader :power_stone_image, PowerStoneImageUploader
  has_many :stone_categories, dependent: :destroy
  has_many :categories, through: :stone_categories, dependent: :destroy
  has_many :have_stones, dependent: :destroy
  has_many :have_stone_power_stones, dependent: :destroy, class_name: "HaveStone"
  has_many :have_stone_users, through: :have_stone_power_stones, source: :user
  has_many :want_stones, dependent: :destroy
  has_many :want_stone_power_stones, dependent: :destroy, class_name: "HaveStone"
  has_many :want_stone_users, through: :want_stone_power_stones, source: :user
  validates :name, presence: true, length: { maximum: 20}
  validates :overview, presence: true, length: { maximum: 10_535 }
end
