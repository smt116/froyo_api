require 'spec_helper'

RSpec.describe FroyoApi::Password do
  let(:password) { FroyoApi::Password.new }
  let(:client) { FroyoApi::Client.new }

  before do
    allow(client).to receive(:request)
    allow(RestClient::Request).to receive(:execute).and_return({
      "version"     => "1.0",
      "attributes"  => {
        "password"  => "wroweste"
      },
      "links"       => {
        "home"      => [{
          "href"    => "http://api.froyo.io/"
        }],
        "profile"   => [{
          "href"=>"http://api.froyo.io/profiles/pwd"
        }]
      }
    })
  end

  context '.length' do
    context 'by default' do
      it { expect(password.length).to eq(8) }
    end

    context 'when initialized with length 12' do
      let(:password) { FroyoApi::Password.new(12) }
      it { expect(password.length).to eq(12) }
    end
  end

  describe '.new' do
    subject { password }

    it { expect(subject.password).to eq('wroweste') }

    context 'length of generated password' do
      it { expect(subject.password.length).to eq(8) }
    end
  end
end
