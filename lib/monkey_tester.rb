require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require "monkey_tester/version"
require "monkey_tester/random_walker"

module MonkeyTester
  # Your code goes here...
  def self.setup!
    Capybara.register_driver :poltergeist do |app|
      Capybara::Poltergeist::Driver.new(app, js_errors: false)
    end

    # Capybara.javascript_driver = :poltergeist
    Capybara.default_driver = :poltergeist
  end
end
