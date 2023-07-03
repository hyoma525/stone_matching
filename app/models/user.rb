class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :email, confirmation: true
  has_many :have_stones, dependent: :destroy
  has_many :have_stones_power_stones, through: :have_stones, source: :power_stone
  has_many :want_stones, dependent: :destroy
  has_many :want_stones_power_stones, through: :want_stones, source: :power_stone
  has_many :posts, dependent: :destroy
  
  def have_stone(power_stone)
    have_stones_power_stones << power_stone
  end

  def unhave_stone(power_stone)
    have_stones_power_stones.delete(power_stone)
  end

  def have_stone?(power_stone)
    HaveStone.where(user_id: id, power_stone_id: power_stone.id).exists?
  end

  def want_stone(power_stone)
    want_stones_power_stones << power_stone
  end

  def unwant_stone(power_stone)
    want_stones_power_stones.delete(power_stone)
  end

  def want_stone?(power_stone)
    WantStone.where(user_id: id, power_stone_id: power_stone.id).exists?
  end

end
