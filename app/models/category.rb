class Category < ApplicationRecord
  has_many :stone_categories, dependent: :destroy
  has_many :power_stones, through: :stone_categories, dependent: :destroy
end
