class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*\d)[a-z\d]{8,}+\z/
  validates :name, presence: true, length: { in: 1..10 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: "を○○@○○.○○の形式で入力して下さい" }, length: { maximum: 255 }
  validates :password, presence: true, length: { maximum: 75 }, format: { with: VALID_PASSWORD_REGEX, message: "を半角英数字8文字以上で入力して下さい" }
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
