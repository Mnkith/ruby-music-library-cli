class Artist extend Concerns::Findable
    @@all = []
    attr_accessor :name
    attr_reader :songs

    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        new(name)
    end

    def save
        @@all << self
    end

    def genres
        songs.map{|song| song.genre}.uniq
    end

    def add_song(song)
        song.artist = self if song.artist == nil
        @songs << song unless @songs.include?(song)
    end


end

