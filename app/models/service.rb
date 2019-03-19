####################
# Service モデル
# @author tanakakota
####################
class Service < ApplicationRecord
  has_many :shops

  # 32桁のランダムな文字列でIDを生成する
  before_create :set_hex_id

  # バリデーション
  validates :wifi_name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :link, allow_nil: true, length: { minimum: 1, maximum: 100 }

  def set_hex_id
    self.id = SecureRandom.hex
  end
end
