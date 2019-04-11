class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  # カートに製品を登録する処理を完結にするためのメソッド
  # プロダクトIDとカートを引数に持ってくることでカート内の製品を特定するorなければ新しく作成
  # 作成したカート製品の数量を変更して保存する
  def self.add_product(product_id, cart)
    cart = CartProduct.find_or_initialize_by(cart: cart, product_id: product_id)
    if cart.quntity.nil?
      cart.quantity = 0
      cart.quantity += 1
    else
      cart.quantity +=1
    end

    cart.save! && cart
  end
  
end
