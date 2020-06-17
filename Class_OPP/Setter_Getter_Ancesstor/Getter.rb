class Getter

  #Getter
  attr_reader :name

  def initialize name
    @name = name
  end


end

getter = Getter.new("Le Van Hau")
puts getter.name