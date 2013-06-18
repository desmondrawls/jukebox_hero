class Genre
  attr_accessor :name, :songs, :artists

  GENRES = []

  def initialize
    GENRES << self
    self.songs = []
    self.artists = []
  end

  def self.reset_genres
    GENRES.clear
  end

  def self.all
    GENRES
  end

end
