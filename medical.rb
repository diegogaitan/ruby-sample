require_relative 'product'
require_relative 'no_basic_tax'

class Medical < Product
  include NoBasicTax
end
