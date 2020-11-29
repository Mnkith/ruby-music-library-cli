class Artist
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

    # def songs 
    #     @songs
    # end

    def add_song(song)
        if song.artist == nil
            @songs << song
            song.artist1 self
        end
    end


end

