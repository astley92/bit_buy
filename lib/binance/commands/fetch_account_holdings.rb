class Binance::Commands::FetchAccountHoldings < ActiveInteraction::Base
  def execute
    details = Binance::Adapter.fetch_account_holdings
  end
end
