module MPesa
  module C2B
    # Client interface for {MPesa::C2B}
    class Client
      # Creates a new instance of {MPesa::C2B::Client}.
      def initialize
        @client = Savon.client do
          env_namespace :soapenv
          wsdl "#{File.dirname(__FILE__)}/wsdl.xml"
        end
      end
    end
  end
end
