class User
  attr_accessor :name, :listens

  def initialize
    @listens = []
  end

  def history
    @listens
  end

  def favorites
    @listens.select {|listen| listen.rank}
  end
end