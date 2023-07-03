class PowerStone < ApplicationRecord
  mount_uploader :power_stone_image, PowerStoneImageUploader
  has_many :stone_categories, dependent: :destroy
  has_many :categories, through: :stone_categories, dependent: :destroy
  has_many :have_stones, dependent: :destroy
  has_many :want_stones, dependent: :destroy
end
