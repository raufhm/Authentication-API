class Product < ApplicationRecord
  belongs_to :kecamatan
  belongs_to :product_type
  has_many :product_invest
end
