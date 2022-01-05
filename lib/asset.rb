class Asset
  attr_reader :symbol, :amount, :aud_value
  def initialize(symbol:, amount:, aud_value:)
    @symbol = symbol
    @amount = amount
    @aud_value = aud_value
  end
end
