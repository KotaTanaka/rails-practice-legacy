class Shop < ApplicationRecord
  # バリデーション
  validates :name, {presence: true, length: {maximum: 100}}
end
