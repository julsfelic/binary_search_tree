require 'pry'

class Node
  attr_reader :data, :left_link, :right_link

  def initialize
    @data = nil
    @left_link  = nil
    @right_link = nil
  end
end
