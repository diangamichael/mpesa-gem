require 'spec_helper'

module MPesa
  module C2B
    describe Client do
      describe '.VERSION' do
        it 'has the specification version defined' do
          expect(MPesa::C2B::VERSION).to eq '2.0'
        end
      end

      describe '.new' do
        it 'returns client instance' do
          client = MPesa::C2B::Client.new(
            merchant_id: '123-456',
            passkey: 'sekret',
            callback_url: 'http://example.com/payments/mpesa',
            callback_method: 'POST'
          )
          expect(client).to be_an_instance_of(MPesa::C2B::Client)
        end
      end
    end
  end
end
