class Book < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :user

  validates :title, presence: true
  validates :body, length: { maximum: 200 }, presence: true
  #titleが存在しているかを確認するバリデーション 要確認
  #bodyが存在しているかを確認するバリデーション 要確認

 
end
