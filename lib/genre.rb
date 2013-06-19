class Genre
  attr_accessor :name, :song, :artist

  GENRES = []

  def initialize
    GENRES << self
    self.song = []
    self.artist = []
  end

  def self.reset_genres
    GENRES.clear
  end

  def self.all
    GENRES
  end

end
