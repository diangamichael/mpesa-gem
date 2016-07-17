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
            merchant_id: Faker::Lorem.characters(16),
            passkey: Faker::Lorem.characters(8),
            callback_url: Faker::Internet.url('example.com'),
            callback_method: Faker::Lorem.characters(4)
          )
          expect(client).to be_an_instance_of(MPesa::C2B::Client)
        end
      end

      describe '#checkout' do
        let(:checkout_request) do
          stub_request(:post, 'https://safaricom.co.ke/mpesa_online/lnmo_checkout_server.php?wsdl')
            .with(headers: { 'Soapaction' => '"processCheckOut"' })
        end

        let(:checkout_response_success) do
          file_path = File.join(MPesa.root, 'spec', 'support', 'files', 'checkout-response-success.xml')
          file = File.new file_path.to_s
          file.read
        end

        let(:checkout_response_failure) do
          file_path = File.join(MPesa.root, 'spec', 'support', 'files', 'checkout-response-failure.xml')
          file = File.new file_path.to_s
          file.read
        end

        let(:transaction_details) do
          {
            transaction_id: 'TRANS-123/05',
            amount: 12_345.56,
            mobile_number: '254711222333',
            reference_id: '1112254500',
            data: { example_1: 'data 1', example_2: 'data 2', example_3: 'data 3' }
          }
        end

        before :context do
          @client = MPesa::C2B::Client.new(
            merchant_id: '123-456',
            passkey: 'sekret',
            callback_url: 'http://example.com/payments/mpesa',
            callback_method: 'POST'
          )
        end

        context 'when response is success' do
          it 'initiates a payment request' do
            checkout_request.to_return(status: 200, body: checkout_response_success)
            response = @client.checkout transaction_details

            expect(response.code).to eq '00'
            expect(response.failure?).to be false
            expect(response.message).to eq 'Example success message here'
            expect(response.success?).to be true
            expect(response.transaction_id).to eq 'cce3d32e0159c1e62a9ec45b67676200'
          end
        end

        context 'when response is failure' do
          it 'initiates a payment request' do
            checkout_request.to_return(status: 200, body: checkout_response_failure)
            response = @client.checkout transaction_details

            expect(response.code).to eq '01'
            expect(response.failure?).to be true
            expect(response.message).to eq 'Example failure message here'
            expect(response.success?).to be false
            expect(response.transaction_id).to eq 'cce3d32e0159c1e62a9ec45b67676200'
          end
        end
      end
    end
  end
end
