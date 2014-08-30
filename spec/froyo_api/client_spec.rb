require 'spec_helper'

RSpec.describe FroyoApi::Client do
  describe '.request' do
    let(:client) { FroyoApi::Client.new }

    before do
      allow(RestClient::Request).
        to receive(:execute).
        with(options).
        and_return({test: 'ok'})
    end

    it { expect(client.request('test')).to eq({test: 'ok'}) }

    private

    def options
      {
        method:   :get,
        url:      "http://api.froyo.io/test",
        headers:  {
          accept:   "application/vnd.collection.doc+json"
        }
      }
    end
  end
end
