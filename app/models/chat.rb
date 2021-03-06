class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :message, presence: true
  # 空白の保存を禁止にする
end
