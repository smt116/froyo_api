module FroyoApi
  class Password < Client
    attr_reader :length, :password

    def initialize(length = 8)
      @length = length
      @password = generate
    end

    private

    def path
      "pwd?length=#{length}"
    end

    def generate
      request(path)['attributes']['password']
    end
  end
end
