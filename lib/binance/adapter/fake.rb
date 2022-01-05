class Binance::Adapter::Fake
  def initialize
    @aud_holdings = 100
    @btc_holdings = 100
  end

  def fetch_account_holdings
    [
      Asset.new(symbol: "AUD", amount: @aud_holdings, aud_value: 1),
      Asset.new(symbol: "BTC", amount: @btc_holdings, aud_value: 10_000),
    ]
  end
end
