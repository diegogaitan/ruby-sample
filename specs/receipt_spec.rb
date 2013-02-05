require_relative '../receipt'
require_relative '../line_item'
require_relative '../product'
require_relative '../book'
require_relative '../food'
require_relative '../medical'

describe Receipt do

  # Input 1
  # Quantity, Product, Price
  # 1, book, 12.49
  # 1, music cd, 14.99
  # 1 chocolate bar, 0.85

  # Output 1
  # 1, book, 12.49
  # 1, music CD, 16.49
  # 1, chocolate bar, 0.85
  #
  # Sales Taxes: 1.50
  # Total: 29.83
  it "returns correct output for input sample 1" do
    book = Book.new(:name => 'book', :price => 12.49, :imported => false)
    music_cd = Product.new(:name => 'music cd', :price => 14.99, :imported => false)
    chocolate_bar = Food.new(:name => 'chocolate bar', :price => 0.85, :imported => false)

    line_items = []

    # Build line items and test each line item total with taxes
    line_items << LineItem.new(1, book)
    line_items[0].price_with_taxes.should == 12.49

    line_items << LineItem.new(1, music_cd)
    line_items[1].price_with_taxes.should == 16.49

    line_items << LineItem.new(1, chocolate_bar)
    line_items[2].price_with_taxes.should == 0.85

    receipt = Receipt.new(line_items)

    # Test receipt totals
    receipt.total_price.should ==  29.83
    receipt.total_taxes.should == 1.50

    # Print the receipt for reference:
    receipt.print('OUTPUT 1')
  end

  # Input 2
  # Quantity, Product, Price
  # 1, imported box of chocolates, 10.00
  # 1, imported bottle of perfume, 47.50

  # Output 2
  # 1, imported box of chocolates, 10.50
  # 1, imported bottle of perfume, 54.65
  #
  # Sales Taxes: 7.65
  # Total: 65.15
  it "returns correct output for input sample 2" do
    box_of_chocolates = Food.new(:name => 'imported box of chocolates', :price => 10.00, :imported => true)
    bottle_of_perfume = Product.new(:name => 'imported bottle of perfume', :price => 47.50, :imported => true)

    line_items = []

    # Build line items and test each line item total with taxes
    line_items << LineItem.new(1, box_of_chocolates)
    line_items[0].price_with_taxes.should == 10.50

    line_items << LineItem.new(1, bottle_of_perfume)
    line_items[1].price_with_taxes.should == 54.65

    receipt = Receipt.new(line_items)

    # Test receipt totals
    receipt.total_price.should == 65.15
    receipt.total_taxes.should == 7.65

    # Print the receipt for reference:
    receipt.print('OUTPUT 2')
  end

  # Input 3
  # Quantity, Product, Price
  # 1, imported bottle of perfume, 27.99
  # 1, bottle of perfume, 18.99
  # 1, packet of headache pills, 9.75
  # 1, box of imported chocolates, 11.25

  # Output 3
  # 1, imported bottle of perfume, 32.19
  # 1, bottle of perfume, 20.89
  # 1, packet of headache pills, 9.75
  # 1, imported box of chocolates, 11.85

  # Sales Taxes: 6.70
  # Total: 74.68
  it "returns correct output for input sample 3" do
    i_perfume = Product.new(:name => 'imported bottle of perfume', :price => 27.99, :imported => true)
    perfume = Product.new(:name => 'bottle of pefume', :price => 18.99, :imported => false)
    pills = Medical.new(:name => 'packet of headache pills', :price => 9.75, :imported => false)
    box_of_i_chocolates = Food.new(:name => 'box of imported chocolates', :price => 11.25, :imported => true)

    line_items = []

    # Build line items and test each line item total with taxes
    line_items << LineItem.new(1, i_perfume)
    line_items[0].price_with_taxes.should == 32.19

    line_items << LineItem.new(1, perfume)
    line_items[1].price_with_taxes.should == 20.89

    line_items << LineItem.new(1, pills)
    line_items[2].price_with_taxes.should == 9.75

    line_items << LineItem.new(1, box_of_i_chocolates)
    line_items[3].price_with_taxes.should == 11.85

    receipt = Receipt.new(line_items)

    # Test receipt totals
    receipt.total_price.should == 74.68
    receipt.total_taxes.should == 6.70

    # Print the receipt for reference:
    receipt.print('OUTPUT 3')
  end

end
