require 'artist.rb'
class Song
    @@all = []
    attr_accessor :name
    attr_reader :artist
    def initialize(name, artist = nil)
        @name = name 
        
        self.artist = artist
        # @artist = artist
        save
    end

    def self.all
        @@all
    end

    def save 
        @@all << self
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        new(name)
    end

    def artist=(artist)
        artist.add_song(self)  if artist != nil
    end

    def artist1(artist)
        @artist = artist
    end
end


    