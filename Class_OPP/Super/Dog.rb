require_relative 'Animal'
class Dog

  def initialize(name, age)
    @name = name
    @age = age
  end

  def initialize(name, age, color)
    @name = name
    @age = age
    @color = color
  end

  def to_s
    super
    puts "Color: #{@color}"
  end
end

dog = Dog.new("Husky", 5)
puts dog.to_s
