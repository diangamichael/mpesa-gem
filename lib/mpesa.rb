require 'savon'

require 'mpesa/c2b'
require 'mpesa/version'

# Abstaction of the M-Pesa G2 Platform which is a SOAP API (yuck).
#
# The new platform provides functionality that covers 3 payment journeys:
#
# 1. B2C (Business to Customers)
# 2. C2B (Customer to Business)
# 3. B2B (Business to Business)
#
# Unlike the old system (G1) where a lot of workarounds had been done to
# automate payment experiences, developers are now able hook directly to the
# core M-PESA and get creative.
module MPesa
  # Get the absolute path of the gem root.
  #
  # @return [String]
  def self.gem_root
    File.dirname __dir__
  end
end
