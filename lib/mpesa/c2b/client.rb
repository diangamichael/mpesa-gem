module MPesa
  module C2B
    # Client interface for {MPesa::C2B}
    class Client
      # Creates a new instance of {MPesa::C2B::Client}.
      #
      # Example:
      #
      #     client = MPesa::C2B::Client.new(
      #       merchant_id: '123-456',
      #       passkey: 'sekret',
      #       callback_url: 'http://example.com/payments/mpesa',
      #       callback_method: 'POST'
      #     )
      #
      # @param merchant_id: [String] The merchant's unique transaction
      #     identifier.
      #
      # @param passkey: [String] Merchant's passwork key provided by Safaricom.
      #
      # @param callback_url: [String] The merchant's payment notification
      #     endpoint URL. Transaction status and the request results will be
      #     sent to this endpoint.
      #
      # @param callback_method: [String] The callback method used to send
      #     parameters to the perchant's payment notification endpoint defined
      #     by `callback_url`.
      def initialize(merchant_id:, passkey:, callback_url:, callback_method:)
        @merchant_id     = merchant_id
        @passkey         = passkey
        @callback_url    = callback_url
        @callback_method = callback_method

        @client = Savon.client do
          soap_version 1
          env_namespace :soapenv
          wsdl File.join(::MPesa.gem_root, 'lib', 'mpesa', 'c2b', 'wsdl.xml').to_s
        end
      end

      # Request the SAG to start the C2B process to complete the MPesa payment.
      #
      # Example:
      #
      #     transaction_details = {
      #       transaction_id: 'TRANS-123/05',
      #       amount: 12_345.56,
      #       mobile_number: '254711222333',
      #       reference_id: '1112254500',
      #       data: { example_1: 'data 1', example_2: 'data 2', example_3: 'data 3' }
      #     }
      #
      #     response = client.checkout transaction_details
      #
      #     puts response.code # => '00'
      #     puts response.success # => true
      #     puts response.transaction_id # => 'cce3d32e0159c1e62a9ec45b67676200'
      #
      # @param amount: [Float] value of the transaction.
      #
      # @param data: [Hash] merchant data that we want to pass along with the
      #   request. It may be anything that may help with transaction processing
      #   later on.
      #
      # @param mobile_number: [String] the customer's mobile phone number.
      #
      # @param reference_id [String] identifier of the product or service being
      #     offered.
      #
      # @param transaction_id [String] unique transaction identifier (respective
      #     to the merchant).
      #
      # @return [MPesa::C2B::Response]
      def checkout(transaction_id:, amount:, mobile_number:, reference_id:, data: {})
        headers  = payment_request_headers
        body     = payment_request_body(transaction_id, amount, mobile_number, reference_id, data)
        response = call __method__, headers, body
        Response.new response
      end

      private

      # Constants
      OPERATION_MAPPING = { checkout: :process_check_out }.freeze

      # Call SOAP operation.
      #
      # @return [Savon::Response]
      def call(method, headers, body)
        operation = OPERATION_MAPPING[method].to_sym
        @client.call(operation) do |locals|
          locals.soap_header headers
          locals.message body
        end
      end

      # Generate password for use with authenticating with SAG.
      #
      # @return [String]
      def password(timestamp)
        string = [@merchant_id, @passkey, timestamp].join(' ')
        hashed_string = Digest::SHA256.hexdigest string
        Base64.encode64(hashed_string).upcase
      end

      # Build SOAP header parameters for the checkout request.
      #
      # Savon 2 doesn't generate header namespaces correctly so we have to sort
      # out that special case appopriately. See: https://github.com/itsmrwave
      # /mpesa-gem/issues/5
      #
      # @return [Hash]
      def payment_request_headers
        { 'tns:CheckOutHeader' => request_headers }
      end

      # Build SOAP body parameters for the checkout request.
      #
      # @return [Hash]
      def payment_request_body(transaction_id, amount, mobile_number, reference_id, data = {})
        body = {
          'MERCHANT_TRANSACTION_ID' => transaction_id,
          'REFERENCE_ID' => reference_id.to_s,
          'AMOUNT' => amount.to_s,
          'MSISDN' => mobile_number.to_s,
          'CALL_BACK_URL' => @callback_url,
          'CALL_BACK_METHOD' => @callback_method
        }
        body['ENC_PARAMS'] = Base64.encode64(data.to_s) unless data.nil?
        body
      end

      # Generate base headers used as authentication and validation parameters.
      #
      # @return [Hash]
      def request_headers
        timestamp = Time.now.to_i.to_s
        {
          'MERCHANT_ID' => @merchant_id,
          'PASSWORD' => password(timestamp),
          'TIMESTAMP' => timestamp
        }
      end
    end
  end
end
