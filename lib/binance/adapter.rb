class Binance::Adapter
  class << self
    delegate :fetch_account_holdings, to: :instance

    def instance
      @instance ||=
        if ENV.fetch("TEST", false)
          Binance::Adapter::Fake.new
        else
          Binance::Adapter::Real.new
        end
    end
  end
end
