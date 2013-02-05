class Receipt

  def initialize(line_items)
    @line_items = line_items
  end

  def total_price
    @line_items.inject(0) do |sum, line_item|
      sum + line_item.total_price_with_taxes
    end.round(2)
  end

  def total_taxes
    @line_items.inject(0) do |sum, line_item|
      sum + line_item.total_taxes
    end.round(2)
  end

  def print(title = 'OUTPUT')
    puts title
    puts "-----------------------------------"

    @line_items.each do |li|
      puts "#{li.quantity}, #{li.product_name}, #{li.price_with_taxes}"
    end

    puts "\n"
    puts "Sales Taxes: #{self.total_taxes}"
    puts "Total: #{self.total_price}"
    puts "\n"
  end

end
