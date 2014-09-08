require 'uri'

module FroyoApi
  class Photo < Client
    attr_reader :href, :type

    def initialize
      @href = attributes['href']
      @type = attributes['type']
    end

    def filename
      @filename ||= begin
        uri = URI.parse(href)
        File.basename(uri.path)
      end
    end

    def download(directory = '.')
      file = File.join(directory, filename)

      File.open(file, 'wb') do |out|
        process_response = lambda do |response|
          response.read_body do |chunk|
            out.write(chunk)
          end
        end

        params = params_for_download.merge(block_response: process_response)
        RestClient::Request.execute(params)
      end
    end

    private

    def attributes
      @attributes ||= fetch
    end

    def params_for_download
      {
        url:      href,
        method:   :get,
        headers:  {
          accept: type
        }
      }
    end

    def path
      "apod"
    end

    def fetch
      request(path)['links']['enclosure'].first
    end
  end
end
