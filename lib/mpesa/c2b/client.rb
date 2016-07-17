module MPesa
  module C2B
    # Client interface for {MPesa::C2B}
    class Client
      # Creates a new instance of {MPesa::C2B::Client}.
      #
      # @param merchant_id: [String] The merchant's unique transaction
      #     identifier.
      #
      # @param callback_url: [String] The merchant's payment notification
      #     endpoint URL. Transaction status and the request results will be
      #     sent to this endpoint.
      #
      # @param callback_method: [String] The callback method used to send
      #     parameters to the perchant's payment notification endpoint defined
      #     by `callback_url`.
      def initialize(merchant_id:, callback_url:, callback_method:)
        @merchant_id     = merchant_id
        @callback_url    = callback_url
        @callback_method = callback_method

        @client = Savon.client do
          soap_version 1
          env_namespace :soapenv
          wsdl "#{File.dirname(__FILE__)}/wsdl.xml"
        end
      end
    end
  end
end
