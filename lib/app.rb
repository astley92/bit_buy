class App
  def self.run
    system("clear")
    account_holdings = Binance::FetchAccountHoldings.run!
    aud_value = account_holdings.select { _1.symbol == "AUD" }[0].amount
    btc_amount = account_holdings.select { _1.symbol == "BTC" }[0].amount
    btc_value = account_holdings.select { _1.symbol == "BTC" }[0].aud_value

    frame = <<~DETAILS
      Current AUD: $#{aud_value}
      Current BTC: #{btc_amount}
      Total AUD Value: #{(btc_amount * btc_value) + aud_value}
    DETAILS

    # TODO: Handle this threading better. Possibly some timing issues.
    output_thread = Thread.new do
      Thread.current["stop"] = false
      loop do
        if Thread.current["stop"] == true
          Thread.current["stop"] = false
          Thread.stop
        end
        system("clear")
        print(frame)
        sleep(1)
      end
    end

    running = true
    while running
      user_input = gets.chomp
      case user_input
      when "b"
        pause_thread(output_thread)
        system("clear")
        puts "TODO: Implement buying"
        resume_thread(output_thread)
      when "s"
        pause_thread(output_thread)
        system("clear")
        puts "TODO: Implement selling"
        resume_thread(output_thread)
      when "q"
        running = false
      end
    end
  end

  def self.pause_thread(thread)
    thread["stop"] = true
  end

  def self.resume_thread(thread)
    thread.run
  end
end
