class PurchaseRecord < ApplicationRecord
   def set_attribute
    
    # 請求先と配送先を用意する
    set_invoice
    set_delivery
    
    # カートから製品情報を取得してdetailを新規作成しておく(未保存)
    # 作成したdetailから製品の各値を取得して合計請求金額を作成する
    set_product_from_cart
    set_amount
  end
end
