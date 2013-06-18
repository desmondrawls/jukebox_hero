require_relative 'song'
require_relative 'genre'

class Artist
  attr_accessor :name, :songs, :genres

  ARTISTS = []

  # Song = ["Song 1", "Song 2"]

  def initialize
    ARTISTS << self
    self.songs = []
    self.genres = []
  end

  def self.reset_artists
    ARTISTS.clear
  end

  def self.all
    ARTISTS
  end

  def self.count
    ARTISTS.count
  end

  def songs_count
    self.songs.count
  end

  def add_song(song)
    self.songs << song
    self.genres << song.genre
    song.genre.artists << self if song.genre && !(song.genre.artists.include?(self)) 
  end

end

# #Test 1
# artist = Artist.new
# song = Song.new
# song.genre = Genre.new.tap{|g| g.name = "rap"}
# artist.add_song(song)

# # A genre has many songs
# genre = Genre.new.tap{|g| g.name = 'rap'}
#   [1,2].each do
#     song = Song.new
#     song.genre = genre
#   end

# # A genre has many artists
# genre = Genre.new.tap{|g| g.name = 'rap'}

# [1,2].each do
#   artist = Artist.new
#   song = Song.new
#   song.genre = genre
#   artist.add_song(song)
# end

# # A genres Artists are unique
# genre = Genre.new.tap{|g| g.name = 'rap'}
# artist = Artist.new

# [1,2].each do
#   song = Song.new
#   song.genre = genre
#   artist.add_song(song)
# end

# The Genre class can keep track of all created genres
# Genre.reset_genres # You must implement a method like this
# genres = [1..5].collect do |i|
#   Genre.new
# end




