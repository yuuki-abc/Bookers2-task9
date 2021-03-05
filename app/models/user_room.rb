class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :room_id, uniqueness: { scope: :user_id }
  # ユーザーの情報とルームはレコードごとに被ることはないように一意の制約をかける

end
