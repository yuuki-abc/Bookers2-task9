class Room < ApplicationRecord

  has_many :messages
  has_many :user_rooms
  has_many :users, through: :user_rooms
  # Roomモデルは、user_roomを経由して(用いて)、userにアクセス出来る。
  # room.userでユーザー一覧を引っ張れる。

end
