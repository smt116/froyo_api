require 'spec_helper'

RSpec.describe FroyoApi::Name do
  let(:name) { FroyoApi::Name.new }

  before do
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

    context 'when initialized with "f"' do
      let(:name) { FroyoApi::Name.new('f') }

      it { expect(name.gender).to eq('f') }
    end
  end

  describe '.attributes' do
    it { expect(name.attributes).to eq({
      'fullname'    => 'Leo King',
      'firstname'   => 'Leo',
      'lastname'    => 'King'
    })}
  end

  describe '.fullname' do
    it { expect(name.fullname).to eq('Leo King') }
  end

  describe '.firstname' do
    it { expect(name.firstname).to eq('Leo') }
  end

  describe '.lastname' do
    it { expect(name.lastname).to eq('King') }
  end
end
