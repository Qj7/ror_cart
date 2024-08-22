product1 = Product.create!(
  name: "Беспроводная колонка Goodyear bluetooth Speaker",
  price: 1600
)
product1.image.attach(
  io: File.open(Rails.root.join('app/assets/images/product_1.png')),
  filename: 'product_1.png',
  content_type: 'image/png'
)

product2 = Product.create!(
  name: "Женский домашний костюм Sweet Dreams",
  price: 800
)
product2.image.attach(
  io: File.open(Rails.root.join('app/assets/images/product_2.png')),
  filename: 'product_2.png',
  content_type: 'image/png'
)

product3 = Product.create!(
  name: "Плащ-дождевик SwissOak",
  price: 800
)
product3.image.attach(
  io: File.open(Rails.root.join('app/assets/images/product_3.png')),
  filename: 'product_3.png',
  content_type: 'image/png'
)
