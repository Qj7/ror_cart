module ProductsHelper
  def print_price(price)
    price.to_i.to_s + ' ₽'
  end

  def formatted_amount(cart_items)
    total = cart_items.sum { |item| item[:product].price * item[:quantity] }
    number_to_currency(total, unit: '₽')
  end
end
