require_relative 'lib/artist'
require_relative 'lib/song'
require_relative 'lib/genre'

our_data = Dir.entries("data").drop(2)

def parser(data)
  data.each do |song|
    throwaway_song = Song.new
    throwaway_song.name = song.split(" - ").at(1).split("[").first
    
    genre_name = song.split("[").last.split("]").first
    genre = Genre.all.select{|genre| genre.name == genre_name}.first
    if genre
        throwaway_song.genre = genre
    else
        genre = Genre.new
        genre.name = genre_name
        throwaway_song.genre = genre
    end
    

    
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