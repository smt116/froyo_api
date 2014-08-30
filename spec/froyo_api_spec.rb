require 'spec_helper'

RSpec.describe FroyoApi do
  describe '::URL' do
    it { expect(FroyoApi::URL).to be_a(String) }
  end

  describe '::VERSION' do
    it { expect(FroyoApi::VERSION).to be_a(String) }
  end
end
