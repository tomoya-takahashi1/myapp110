class ApiProduct < ApplicationRecord
  mount_uploader :image, ImageUploader
  def self.save_products_from_api(api_data)
    api_data.each do |product|
      ApiProduct.create(
        name: product['name'],
        price: product['price'],
        description: product['description']
      )
    end
  end
end
