class Review < ApplicationRecord
  # バリデーション
  validates :content, {presence: true, length: {maximum: 500}}
end
