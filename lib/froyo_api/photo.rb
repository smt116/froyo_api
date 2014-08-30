module FroyoApi
  class Photo < Client
    attr_reader :href, :type

    def initialize
      @href = attributes['href']
      @type = attributes['type']
    end

    private

    def attributes
      @attributes ||= fetch
    end

    private

    def path
      "apod"
    end

    def fetch
      request(path)['links']['enclosure'].first
    end
  end
end
