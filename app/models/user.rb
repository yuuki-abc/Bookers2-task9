class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  attachment :profile_image, destroy: false

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, presence: true, on: :update # 質問
  validates :introduction, length: { maximum: 50 }

  # ここ以下、課題7で追加した内容
  include JpPrefecture
  jp_prefecture :prefecture_code
  # ↑ 都道府県コードから都道府県名に自動で変換する。

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  # ↑2つ、
  # ~.prefecture_nameで都道府県名を参照出来る様にする。
  # 例) @user.prefecture_nameで該当ユーザーの住所(都道府県)を表示出来る。

  # ここ以上、課題7で追加した内容

  with_options presence: true, on: :create do
  validates :postcode
  end

  # 以下課題9で設定

  has_many :chats
  has_many :user_rooms
  has_many :rooms, through: :user_rooms

  # 以上課題9で設定

end
