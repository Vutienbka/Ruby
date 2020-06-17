class Accessor
  #Chung ta tao getter va setter cho hai bien name va age
  attr_accessor :name, :age

  def initialize name, age
    @name = name
    @age = age
  end

  def to_s
    puts "Name: #{@name}  age: #{@age}"
  end
end


accessor = Accessor.new("",0)
accessor.to_s
accessor.name = "Le Van Hau"
accessor.age = 25
accessor.to_s

