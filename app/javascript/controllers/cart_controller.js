import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["quantity", "price", "totalQuantity", "totalAmount", "discountAmount", "finalAmount", "discountRange"]

  connect() {
    this.updateTotalAmount();
  }

  increase(event) {
    const quantityInput = event.currentTarget.closest('.cart-item').querySelector('[data-cart-target="quantity"]');
    quantityInput.value = parseInt(quantityInput.value) + 1;
    this.updatePriceAndQuantity(quantityInput);
  }

  decrease(event) {
    const quantityInput = event.currentTarget.closest('.cart-item').querySelector('[data-cart-target="quantity"]');
    if (parseInt(quantityInput.value) > 1) {
      quantityInput.value = parseInt(quantityInput.value) - 1;
      this.updatePriceAndQuantity(quantityInput);
    }
  }

  updatePriceAndQuantity(quantityInput) {
    const priceElement = quantityInput.closest('.cart-item').querySelector('[data-cart-target="price"]');
    const quantity = parseInt(quantityInput.value);
    const pricePerUnit = parseFloat(priceElement.dataset.pricePerUnit);
    const newPrice = quantity * pricePerUnit;
    priceElement.textContent = `${Math.round(newPrice)} ₽`;
    this.updateTotalAmount();
  }

  handleQuantityChange(event) {
    const input = event.target;
    this.updatePriceAndQuantity(input);
  }

  updateTotalAmount() {
    let totalAmount = 0;
    let totalQuantity = 0;
    this.quantityTargets.forEach(input => {
      const quantity = parseInt(input.value);
      totalQuantity += quantity;
      const pricePerUnit = parseFloat(input.closest('.cart-item').querySelector('[data-cart-target="price"]').dataset.pricePerUnit);
      totalAmount += quantity * pricePerUnit;
    });
    this.totalQuantityTarget.textContent = `${totalQuantity}`;
    this.totalAmountTarget.textContent = `${Math.round(totalAmount)} ₽`;
    this.updateDiscount();
  }

  updateDiscount() {
    const discountValue = Math.round(parseFloat(this.discountRangeTarget.value));
    this.discountAmountTarget.textContent = `${discountValue} ₽`;
    const totalAmount = Math.round(parseFloat(this.totalAmountTarget.textContent));
    const discountedAmount = totalAmount - discountValue;
    this.finalAmountTarget.textContent = `${discountedAmount} ₽`;
  }
}
