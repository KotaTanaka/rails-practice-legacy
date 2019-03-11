####################
# Shop モデル
####################
class Shop < ApplicationRecord
  belongs_to :service
  has_many :reviews

  # UUIDでIDを生成する
  before_create :set_uuid

  def set_uuid
    self.id = SecureRandom.uuid
  end
end
