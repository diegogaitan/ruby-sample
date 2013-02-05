require_relative 'product'
require_relative 'no_basic_tax'

class Food < Product
  include NoBasicTax
end
