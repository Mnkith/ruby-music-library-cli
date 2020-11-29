class MusicImporter
  attr_reader :files, :path
  def initialize(path)
    @path = path 
    @files = []
  end

  def files
    @files = Dir.children(@path)
  end

  def import
    files.each{|file| Song.create_from_filename(file)}
  end
end
