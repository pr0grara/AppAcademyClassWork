require_relative "card"

class Deck

  SUITES = [:red, :black, :green, :blue]
  attr_accessor :stack

  def initialize
    @stack = []
    SUITES.each do |suit|
      (1..13).each { |value| @stack << Card.new(value, suit) }
    end
  end

  def deck_shuffle
    #stack.shuffle!
  end
end