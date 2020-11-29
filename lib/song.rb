class Song extend Concerns::Findable
    @@all = []
    attr_accessor :name
    attr_reader :artist, :genre
    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist
        self.genre = genre if genre
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
        if artist
            @artist = artist
            artist.add_song(self)
        end
    end

    def genre=(genre)
        @genre = genre 
        genre.songs << self unless genre.songs.include?(self)
    end

    def artist1(artist)
        @artist = artist
    end

    def self.new_from_filename(filename)
        info = filename.split(/[-.]/)
        song = find_or_create_by_name(info[1].strip)
        song.artist = Artist.find_or_create_by_name(info[0].strip)
        song.genre = Genre.find_or_create_by_name(info[2].strip)
        song
    end

    def self.create_from_filename(filename)
        new_from_filename(filename)
    end
end


    