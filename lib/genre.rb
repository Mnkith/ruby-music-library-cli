class Genre
    @@all = []
    attr_accessor :name

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.create(name)
        new(name)
    end

    def self.all
        @@all
    end

    def self.destroy_all
        all.clear
    end
end
