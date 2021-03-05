class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.text :message, null: false

      # null: falseとは、データベースレベルで空白の入力を禁止する記述。

      t.timestamps
    end
  end
end
