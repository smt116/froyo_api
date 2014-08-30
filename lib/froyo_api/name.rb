module FroyoApi
  class Name < Client
    attr_reader :gender, :fullname, :firstname, :lastname

    def initialize(gender = 'm')
      @gender = gender
      @fullname = attributes['fullname']
      @firstname = attributes['firstname']
      @lastname = attributes['lastname']
    end

    def attributes
      @attributes ||= generate
    end

    private

    def path
      "names?gender=#{gender}"
    end

    def generate
      request(path)['attributes']
    end
  end
end
