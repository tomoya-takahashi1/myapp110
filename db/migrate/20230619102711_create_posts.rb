class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :set
      t.string :introduction

      t.timestamps
    end
  end
end
