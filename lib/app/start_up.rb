class App::StartUp < ActiveInteraction::Base
  def execute
    puts "Fetching your current account holdings."
    account_holdings = Binance::Commands::FetchAccountHoldings.run
  end
end
