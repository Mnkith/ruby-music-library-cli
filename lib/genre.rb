class Genre extend Concerns::Findable
    @@all = []
    attr_accessor :name
    attr_reader :songs

    def initialize(name)
        @name = name
        @songs = []
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

    def artists
        songs.map{|song| song.artist}.uniq
    end
end
