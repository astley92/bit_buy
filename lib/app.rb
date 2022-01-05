class App
  def self.run
    details = App::StartUp.run
    App::MainLoop.run(
      details: details
    )
  end
end
