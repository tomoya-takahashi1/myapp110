class AddEffectAndUserIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :effect, :string unless column_exists?(:posts, :effect) # 既にカラムが存在する場合は追加しない
    add_column :posts, :user_id, :integer unless column_exists?(:posts, :user_id) # 既にカラムが存在する場合は追加しない
  end
end
