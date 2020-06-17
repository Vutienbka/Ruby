class Animal
  def initialize name, age
    @name = name
    @age = age
  end

  def to_s
    puts "Name: #{@name}   Age: #{@age}"
  end
end