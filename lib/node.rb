require 'pry'

class Node
  attr_accessor :left_link, :right_link
  attr_reader :data

  def initialize
    @data = nil
    @left_link  = nil
    @right_link = nil
  end
end
