class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :email, confirmation: true
  has_many :have_stones, dependent: :destroy
  has_many :have_stone_power_stones, through: :have_stones, source: :power_stone
  has_many :want_stones, dependent: :destroy
  has_many :want_stone_power_stones, through: :want_stones, source: :power_stone
  has_many :posts, dependent: :destroy
  
  def have_stone(power_stone)
    have_stone_power_stones << power_stone
  end

  def unhave_stone(power_stone)
    have_stone_power_stones.destroy(power_stone)
  end

  def have_stone?(power_stone)
    have_stone_power_stones.include?(power_stone)
  end

  def want_stone(power_stone)
    want_stone_power_stones << power_stone
  end

  def unwant_stone(power_stone)
    want_stone_power_stones.destroy(power_stone)
  end

  def want_stone?(power_stone)
    want_stone_power_stones.include?(power_stone)
  end

end
