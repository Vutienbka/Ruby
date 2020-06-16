$gl = 5
module ModuleM
  puts "Inside module"
  puts $gl
end

def FunctionM
  puts "Inside method"
  puts $gl
end

class ClassM
  puts "Inside class"
  puts $gl
end

puts "At a top level"
puts $gl
#Kiem tra $gl co phai la bien toan cuc hay khong
puts global_variables.include? :$gl

