require 'spec_helper'

RSpec.describe FroyoApi::Name do
  let(:name) { FroyoApi::Name.new }
  let(:client) { FroyoApi::Client.new }

  before do
    allow(client).to receive(:request)
    allow(RestClient::Request).to receive(:execute).and_return({
      'version'     => '1.0',
      'attributes'  => {
        'fullname'    => 'Leo King',
        'firstname'   => 'Leo',
        'lastname'    => 'King'
      },
      'links'       => {
        'home'      => [{
          'href'    => 'http://api.froyo.io/'
        }],
        'profile'   => [{
          'href'=>'http://api.froyo.io/profiles/pwd'
        }]
      }
    })
  end

  context '.gender' do
    context 'by default' do
      it { expect(name.gender).to eq('m') }
    end

    context 'when initialized with "k"' do
      let(:name) { FroyoApi::Name.new('k') }
      it { expect(name.gender).to eq('k') }
    end
  end

  describe '.attributes' do
    subject { name.attributes }

    it { expect(subject).to be_a(Hash) }
    it { expect(subject).to eq({
      'fullname'    => 'Leo King',
      'firstname'   => 'Leo',
      'lastname'    => 'King'
    })}
  end

  describe '.fullname' do
    subject { name.fullname }

    it { expect(subject).to be_a(String) }
    it { expect(subject).to eq('Leo King') }
  end

  describe '.firstname' do
    subject { name.firstname }

    it { expect(subject).to be_a(String) }
    it { expect(subject).to eq('Leo') }
  end

  describe '.lastname' do
    subject { name.lastname }

    it { expect(subject).to be_a(String) }
    it { expect(subject).to eq('King') }
  end
end
