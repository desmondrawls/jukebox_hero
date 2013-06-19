require_relative 'listen'
require_relative 'user'
require_relative 'parser'

class Jukebox
  COMMANDS = ["list artists", "list songs", "list genres", "select", "play", "clear"]

  #attr_accessor :users :current_user :songs :command :current_listen

  def initialize
    puts "Welcome! What's your name?"
    store_user(gets.chomp)
    @library = []
    prompt
  end

  #called from initialize only
  def store_user(name)
    if @users == nil
      @current_user = User.new
      @current_user.name = name
      @users = [@current_user]
    else
      if @users.select{|user| user.name == name} == []
        @current_user = User.new
        @current_user.name = name
        @users << @current_user
      else
        @current_user = @users.select{|user| user.name == name}.first
      end
    end
  end

  #called from EVERYWHERE
  #this prompt could only show part of the commands list
  #depending on whether @current_directory is odd/even
  def prompt(caller = nil)
    case caller
    when "list"
      puts "please select by number"
    # when "select"
    #   puts ""
    else
      COMMANDS.each_with_index{|command, index| puts index.to_s + "." + command}
    end
    @command = gets.chomp
    execute(@command)
  end


private
  #called from prompt only
  def execute(command)
    case command.split.first
    when "list"
      list(@command)
    when "play"
      # if @library.empty? || @library.length.even?
      #   puts "that doesn't make any sense"
      #   prompt
      # else
        play(@command)
      # end
    when "select"
      if @library.empty? 
        # || @library.length.even?
        puts "that doesn't make any sense"
        prompt
      else
        select(@command, @library)
      end
    when "clear"
      clear
    else
      puts "The commands are: play, select, etc"
    end
  end

#------------------executions--------------------#


  #called from execute only
  def list(command)
    case command.split.at(1)
    when "artists" || "artist" || "Artists" || "Artist"
      navigate(Artist)
    when "songs" || "song" || "Songs" || "Song"
      navigate(Song)
    when "genres" || "genre" || "Genre" || "Genres"
      navigate(Genre)
    else
      puts "The commands are:" + Commands::list
    end
    @library.each_with_index {|member, index| puts index.to_s + "." + member.name}
    prompt("list")
  end

  #called from execute only
  def play (command)
    song_name = command.split.at(1)
    puts "you are listening to song_name"
    register(song_name)
    puts "please rank it 1-5"
    response = gets.chomp
    rank(response)
    @library = []
    prompt
  end

  #called from execute only
  def select(command, library)
    # if @library.empty?
    selection = command.split.at(1).to_i
    puts "You selected #{@library[selection].name}"
    @library = @library[selection]
    prompt
  end

  #called from execute only
  def clear()
    @library = []
    prompt
  end


#------------support for executions------------#
  #called from list only
  def navigate(category)
    if @library == []
      @library = category.all
    else
      filter = category.to_s.downcase
      @library = @library.send(filter)
    end
  end

  #called from play only
  def register(song_name)
    prior_play = @current_user.listens.select{|listen| listen.name == song_name}.first
    if prior_play
      @current_listen = prior_play
      @current_listen.plays += 1
    else
      @current_listen = Listen.new
      @current_listen.name = song_name
      @current_listen.plays = 1
      @current_user.listens << @current_listen
    end
  end

  #called from play only
  def rank(response)
    rank = response.to_i
    if rank >= 1 && rank <= 5
      @current_listen.rank = rank
    else
      puts "please enter a number 1-5"
      response = gets.chomp
      rank(response)
    end
  end

end

jukebox = Jukebox.new




