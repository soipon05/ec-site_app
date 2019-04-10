class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  # 自身のカート内の製品一覧を出すため用のメソッド
  def self.search(user)
    if user.present?
      CartProduct.where(cart: user.cart)
    else
      nil
    end
  end
end
