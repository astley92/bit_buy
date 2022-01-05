RSpec.describe Binance::FetchAccountHoldings do
  subject(:details) { described_class.run! }

  it "returns an array of two Asset objects, one for AUD and one for BTC" do
    expect(details).to be_an(Array)
    expect(details).to all(be_an(Asset))
  end
end
