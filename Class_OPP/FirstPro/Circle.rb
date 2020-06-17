require_relative 'Shape'

class Circle < Shape
  @@PI = 3.14

  def initialize r
    @radius = r
  end

  def area
    return @radius * @@PI
  end

  def draw
    puts "Draw circle"
  end

  def to_s
    puts "This is a circle has area is: #{area}"
  end
end

c1 = Circle.new(150)
puts c1.area
c1.draw
