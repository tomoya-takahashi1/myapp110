class AddMuscleToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :muscle, :string
  end
end
