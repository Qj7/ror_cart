class CartController < ApplicationController
  before_action :initialize_cart, only: [:show, :add_random, :remove, :clear, :finish_order]

  def show
    @cart_items = @cart.map do |product_id, quantity|
      product = Product.find(product_id)
      { product: product, quantity: quantity }
    end
  end

  def remove
    @product = Product.find(params[:product_id])
    @cart.delete(@product.id.to_s)
    save_cart
    redirect_to cart_path, notice: "Товар удален из корзины."
  end

  def clear
    @cart.clear
    save_cart
    redirect_to cart_path, notice: "Корзина очищена."
  end

  def finish_order
    @cart.clear
    session[:cart] = nil
    redirect_to cart_path, notice: "Заказ оформлен."
  end

  def add_random
    Product.all.each do |product|
      quantity = rand(1..3)
      product_id = product.id.to_s
      if @cart.key?(product_id)
        @cart[product_id] += quantity
      else
        @cart[product_id] = quantity
      end
    end

    save_cart
    redirect_to cart_path, notice: "Тестовые данные установлены."
  end

  private

  def initialize_cart
    @cart = session[:cart] ||= {}
  end

  def save_cart
    session[:cart] = @cart
  end
end