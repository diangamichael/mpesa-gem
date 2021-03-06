# The Coveralls.wear! must occur before any of our application code is
# required, so should be at the very top
require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'faker'
require 'mpesa'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    # Disable should syntax
    c.syntax = :expect
  end
end
