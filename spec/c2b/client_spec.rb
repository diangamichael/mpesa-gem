require 'spec_helper'

module MPesa
  module C2B
    describe Client do
      describe '.new' do
        it 'returns client instance' do
          client = MPesa::C2B::Client.new
          expect(client).to be_an_instance_of(MPesa::C2B::Client)
        end
      end
    end
  end
end
