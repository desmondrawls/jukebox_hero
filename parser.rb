require_relative 'lib/artist'
require_relative 'lib/song'
require_relative 'lib/genre'

our_data = Dir.entries("data").drop(2)

def parser(data)
  data.each do |song|
    throwaway_song = Song.new
    throwaway_song.name = song.split(" - ").at(1).split("[").first
    throwaway_genre = Genre.new
    throwaway_song.genre = throwaway_genre
    throwaway_genre.name = song.split("[").last.split("]").first

    
    artist_name = song.split(" - ").first.to_s
    artist = Artist.all.select{|artist| artist.name == artist_name}.first
    if artist == nil
        artist = Artist.new
        artist.name = artist_name
        artist.add_song(throwaway_song)
    else
        artist.add_song(throwaway_song)
    end

    throwaway_song.artist = artist
  end
end

parser(our_data)

#What should each song unit look like