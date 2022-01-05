RSpec.describe App::StartUp do
  subject(:start_app) { described_class.run }

  it "outputs a message indicating that current holdings are being retrieved" do
    expect { start_app }.to output(/Fetching your current account holdings./).to_stdout
  end

  it "fetches the current account details" do
    expect(Binance::Adapter).to receive(:fetch_account_holdings)
    start_app
  end
end
