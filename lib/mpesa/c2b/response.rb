module MPesa
  module C2B
    # Response handler for {MPesa::C2B::Client} requests.
    #
    # This class is used by {MPesa::C2B::Client} internally to process request
    # responses and is not intended to be used in isolation.
    class Response
      # Creates a new instance of {MPesa::C2B::Response}.
      #
      # @param response [Savon::Response] Savon Response object.
      def initialize(response)
        @response = response
      end

      # Gets the response code
      #
      # @return [String]
      def code
        body[:return_code].to_s
      end

      # Check if the request made initially resulted in a failure.
      #
      # @return [Boolean]
      def failure?
        !success?
      end

      # Gets the response message.
      #
      # @return [String]
      def message
        body[:cust_msg].to_s
      end

      # Check if the request made initially was successful.
      #
      # @return [Boolean]
      def success?
        case body[:description].to_s
        when 'Success' then true
        when 'Failure' then false
        end
      end

      # Gets the request-reponse transaction id
      #
      # @return [String]
      def transaction_id
        body[:trx_id].to_s
      end

      private

      # Get the body of the response.
      #
      # @return [Hash]
      def body
        @response.body[:process_check_out_response]
      end
    end
  end
end
