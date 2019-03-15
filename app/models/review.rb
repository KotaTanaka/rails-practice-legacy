####################
# Review モデル
####################
class Review < ApplicationRecord
  belongs_to :shop
  
  # 32桁のランダムな文字列でIDを生成する
  before_create :set_hex_id

  # バリデーション
  validates :comment, presence: true, length: { minimum: 1, maximum: 500 }
  validates :shop_id, presence: true
  validates :evaluation, presence: true

  def set_hex_id
    self.id = SecureRandom.hex
  end
end
