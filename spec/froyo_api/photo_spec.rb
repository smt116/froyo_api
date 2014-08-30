require 'spec_helper'

RSpec.describe FroyoApi::Photo do
  let(:photo) { FroyoApi::Photo.new }
  let(:client) { FroyoApi::Client.new }

  before do
    allow(client).to receive(:request)
    allow(RestClient::Request).to receive(:execute).and_return({
      'version'       => '1.0',
      'attributes'    => {
        'title'       => 'Example title'
      },
      'links'         => {
        'home'        => [{
          'href'      => 'http://api.froyo.io/'
        }],
        'profile'     => [{
          'href'      => 'http://example.com/profile'
        }],
        'distributor' => [{
          'href'      => 'http://example.com/test',
          'title'     => 'Example'
        }],
        'enclosure'   => [{
          'href'      => 'http://example.com/test.jpg',
          'type'      => 'image/jpeg'
        }]
      }
    })
  end

  describe '.href' do
    it { expect(photo.href).to eq('http://example.com/test.jpg') }
  end

  describe '.type' do
    it { expect(photo.type).to eq('image/jpeg') }
  end
end
