class LineItem
  attr_reader :quantity

  def initialize(quantity, product)
    @quantity = quantity
    @product = product
  end

  def product_name
    @product.name
  end

  def price_with_taxes
    @product.price_with_taxes
  end

  def total_taxes
    @quantity * @product.total_taxes
  end
  
  def total_price_with_taxes
    @quantity * self.price_with_taxes
  end

end
