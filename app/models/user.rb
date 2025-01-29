class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 } 
  



  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end


#「:database_authenticatable, :registerable,」のように、devise の後ろに :（コロン）で始まる部分が devise の機能名です。

#:database_authenticatable（パスワードの正確性を検証）
#:registerable（ユーザ登録や編集、削除）
#:recoverable（パスワードをリセット）
#:rememberable（ログイン情報を保存）
#:validatable（email のフォーマットなどのバリデーション）