require_relative 'product'
require_relative 'no_basic_tax'

class Book < Product
  include NoBasicTax
end
