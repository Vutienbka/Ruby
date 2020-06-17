class Setter

  attr_accessor :name

  def initialize name
    @name = name
  end

  def get_name
    return @name
  end

end


setter = Setter.new("")
setter.name = "Le van Hau"
setter.get_name

puts "- : #{10}"
