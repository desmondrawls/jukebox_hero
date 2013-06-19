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
    artist = Artist.all.select{|artist| artist.name == artist_name}
    if artist == nil
        artist = Artist.new
        artist.name = artist_name
        artist.add_song(throwaway_song)
    else
        
    end
    artist.add_song(throwaway_song)

    throwaway_song.artist = throwaway_artist
  end
end

p parser(our_data)

p Song.all

#What should each song unit look like