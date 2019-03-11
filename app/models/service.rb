####################
# Service モデル
####################
class Service < ApplicationRecord
  has_many :shops

  # 32桁のランダムな文字列でIDを生成する
  before_create :set_hex_id

  def set_hex_id
    self.id = SecureRandom.hex
  end
end
