class CreateApiProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :api_products do |t|
      t.string :name
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
