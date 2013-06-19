# jukebox.rb

require_relative 'parser'

class Jukebox
  
  @@jukeboxes = {}

  def initialize (name)
    @@on = true
    @name = name
    @user_tracks = []
    @@jukeboxes[:name] = @user_tracks
    puts "You are now on user #{name}"
  end

  def jukehistory
    @@jukeboxes.each do 
      puts "#{@name} listened to: #{@@jukeboxes[:name]}"
    end
  end


  @@SONGS = [
    "The Phoenix - 1901",
    "Tokyo Police Club - Wait Up",
    "Sufjan Stevens - Too Much",
    "The Naked and the Famous - Young Blood",
    "(Far From) Home - Tiga",
    "The Cults - Abducted",
    "The Phoenix - Consolation Prizes"
  ]
  # list, play, help, exit

  def list
    if @@on
      @@SONGS.each.with_index do |song, index|
        puts (index + 1).to_s + ". " + song
      end
    else
      puts "please turn the Jukebox on first, #{@name}"
      return
    end
  end

  def play
    if @@on
      puts "Please select the song number you would like to play"
      number = gets.strip.to_i
      number -= 1
      puts "You are currently playing #{@@SONGS[number]}"
      @user_tracks << @@SONGS[number]
    else
      puts "please turn the Jukebox on first, durr"
      return
    end
  end

  def help
    if @@on
      puts "to see all available songs type '(your jukebox's name).list'"
      puts "to play a song type play then select its index number from the list"
      puts "to turn the jukebox off type exit"
    else
      puts "please turn the Jukebox on first, durr"
      return
    end
  end

  def exit
    @@on = false
  end

end

#instantiate class

# jukebox = Jukebox.new('jack')
# play = jukebox.play
# play = jukebox.play
# play = jukebox.play
# jukehistory = jukebox.jukehistory