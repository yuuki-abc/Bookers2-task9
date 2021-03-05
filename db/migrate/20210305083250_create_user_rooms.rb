class CreateUserRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :user_rooms do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true

      # foreign_key: trueとは、
      # 外部キーの対応するレコードが必ず存在しなくてはいけないという制約

      t.timestamps
    end
  end
end
