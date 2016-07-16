# The Coveralls.wear! must occur before any of our application code is
# required, so should be at the very top
require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'mpesa'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    # Disable should syntax
    c.syntax = :expect
  end
end
