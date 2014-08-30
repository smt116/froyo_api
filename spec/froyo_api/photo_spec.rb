require 'spec_helper'

RSpec.describe FroyoApi::Photo do
  let(:photo) { FroyoApi::Photo.new }

  before do
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

  describe '.filename' do
    it { expect(photo.filename).to eq('test.jpg') }
  end

  describe '.download' do
    before do
      allow(RestClient::Request).
      to receive(:execute).
      with({
        url:            'http://example.com/test.jpg',
        method:         :get,
        block_response: nil,
        headers:        {
          accept: 'image/jpeg'
        }
      })
    end

    context 'directory' do
      context 'by default' do
        it 'should eq ./test.jpg' do
          expect(File).to receive(:open).with('./test.jpg', anything)
          photo.download
        end
      end

      context 'when directory argument is present' do
        it 'should eq /tmp/test.jpg' do
          expect(File).to receive(:open).with('/tmp/test.jpg', anything)
          photo.download('/tmp')
        end
      end
    end
  end
end
