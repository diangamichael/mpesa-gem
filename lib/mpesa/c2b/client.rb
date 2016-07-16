module MPesa
  module C2B
    class Client
      def initialize
        @client = Savon.client do
          wsdl "#{File.dirname(__FILE__)}/wsdl.xml"
        end
      end
    end
  end
end
