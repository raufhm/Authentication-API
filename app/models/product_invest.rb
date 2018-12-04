class ProductInvest < ApplicationRecord
  belongs_to :product
  has_many :product_invest_detail

  default_scope { order(count_view: :desc)}

end
