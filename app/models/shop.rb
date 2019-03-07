####################
# Shop モデル
####################
class Shop < ApplicationRecord
  # UUIDでIDを生成する
  before_create :set_uuid

  def set_uuid
    self.id = SecureRandom.uuid
  end
end
