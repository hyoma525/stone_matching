class PowerStone < ApplicationRecord
  has_many :stone_categories, dependent: :destroy
  has_many :categories, through: :stone_categories, dependent: :destroy
end
