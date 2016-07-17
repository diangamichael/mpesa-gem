require 'savon'

require 'mpesa/c2b'
require 'mpesa/version'

module MPesa
  # Get the absolute path of the gem root.
  #
  # @return [String]
  def self.root
    File.dirname __dir__
  end
end
