class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false #タイトル
      t.text :body, null: false #感想
      t.references :user, null: false, foreign_key: true #投稿したユーザー　外部キー
      t.timestamps
    end
  end
end
