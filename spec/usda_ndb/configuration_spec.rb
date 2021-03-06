require 'spec_helper'

RSpec.describe UsdaNdb::Configuration do
  before { UsdaNdb.reset_configuration }

  describe '.api_key' do
    it 'should return default api key' do
      expect(UsdaNdb.configuration.api_key).to eq UsdaNdb::Configuration::DEFAULT_API_KEY
    end
  end

  describe '.endpoint_base' do
    it 'should return default endpoint base' do
      expect(UsdaNdb.configuration.endpoint_base).to eq UsdaNdb::Configuration::DEFAULT_ENDPOINT_BASE
    end
  end

  describe '.format' do
    it 'should return default format' do
      expect(UsdaNdb.configuration.response_format).to eq UsdaNdb::Configuration::DEFAULT_FORMAT
    end
  end

  describe '.configure' do
    after { UsdaNdb.reset_configuration }

    it 'should set new values' do
      UsdaNdb.configure do |config|
        config.api_key = 'foo'
      end
      expect(UsdaNdb.configuration.api_key).to eq 'foo'
    end
  end

  describe '.reset' do
    before do
      UsdaNdb.configure do |config|
        config.api_key = 'foo'
      end
    end

    it 'should set values back to defaults' do
      expect(UsdaNdb.configuration.api_key).to eq 'foo'
      UsdaNdb.reset_configuration
      expect(UsdaNdb.configuration.api_key).to eq UsdaNdb::Configuration::DEFAULT_API_KEY
    end
  end
end
