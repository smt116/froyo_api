require 'rest_client'
require 'json'

module FroyoApi
  class Client
    def request(path)
      options = params(path)
      RestClient::Request.execute(options) do |response, request|
        JSON.parse(response.body)
      end
    end

    private

    def headers
      {
        accept: 'application/vnd.collection.doc+json'
      }
    end

    def params(path)
      {
        method:   :get,
        url:      "#{FroyoApi::URL}/#{path}",
        headers:  headers
      }
    end
  end
end
