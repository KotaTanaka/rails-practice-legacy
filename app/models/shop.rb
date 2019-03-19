####################
# Shop モデル
# @author tanakakota
####################
class Shop < ApplicationRecord
  belongs_to :service
  has_many :reviews

  # UUIDでIDを生成する
  before_create :set_uuid

  # バリデーション
  validates :shop_name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :ssid, presence: true, length: { minimum: 1, maximum: 100 }
  validates :address, presence: true, length: { minimum: 1, maximum: 100 }
  validates :access, allow_nil: true, length: { minimum: 1, maximum: 200 }
  validates :shop_type, allow_nil: true, length: { minimum: 1, maximum: 10 }
  validates :opening_hours, allow_nil: true, length: { minimum: 1, maximum: 30 }
  validates :seats_num, allow_nil: true, numericality: true
  validates :power, allow_nil: true, boolean: true
  validates :description, allow_nil: true, length: { minimum: 1, maximum: 500 }
  validates :service_id, presence: true

  def set_uuid
    self.id = SecureRandom.uuid
  end
end
