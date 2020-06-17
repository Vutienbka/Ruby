#Bien instance ky hieu @ten_bien
# Dung cho mot doi tuong rieng le va pham vi cua no la toan bo rong mot lop
class Existing
  # bien lop dung chung cho tat ca doi tuong
  @@is = true

  # Tao constructor
  def initialize(name)
    @name = name
  end

  #toString
  def to_s
    puts "This is: #{@name}"
  end

  #getter bien lop
  def does_exist?
    @@is
  end
  #getter thuoc tinh lop
  def get_name
    @name
  end

end

b1 = Existing.new "Jonh"
b2 = Existing.new "Mark"

b1.to_s
b1.get_name #chi co doi tuong b1 moi truy cap duoc

#@@is la bien lop dung chung cho tat ca cac doi tuong
p b1.does_exist?
p b2.does_exist?


