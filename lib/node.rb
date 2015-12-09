require 'pry'

class Node
  attr_accessor :data, :left_link, :right_link

  def initialize(data=nil)
    @data = data
    @left_link  = nil
    @right_link = nil
  end
end
