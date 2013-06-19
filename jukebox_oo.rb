require_relative 'parser'

class Jukebox

  puts "Welcome to the jukebox!"
  
  def initialize
    prompt_initial
  end

  def prompt_initial
    puts "What do you want to do?"
    root_list
    @choice = gets.chomp.to_s
    puts @choice
    root_choice(@choice)
  end


  def root_list
    puts "1. Artists"
    puts "2. Songs"
    puts "3. Genres"
  end


  def root_choice(input)
    case input
    when "1"
      @start = []
      Artist.all.each {|a| @start.include?(a) || @start << a}
      @start.each {|a| puts a.name, a.object_id}

    when "2"
      @start = Song.all
    when "3"
      @start = Genre.all
    end
  end

end

juke = Jukebox.new