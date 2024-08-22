require 'test_helper'

class CartFlowTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  fixtures :all

  setup do
    Capybara.current_driver = :selenium_chrome_headless
    puts "Setup completed"
  end

end