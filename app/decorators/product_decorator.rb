module ProductDecorator

  def public_price
         number_to_currency(price, unit: "¥", precision: 0)
  end
end
