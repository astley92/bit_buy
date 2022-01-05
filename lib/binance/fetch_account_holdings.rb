class Binance::FetchAccountHoldings < ActiveInteraction::Base
  def execute
    all_holdings = Binance::Adapter.fetch_account_holdings
  end
end
