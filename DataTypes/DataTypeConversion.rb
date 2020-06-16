p Array(1..6)
p Complex 6
p Float 12
p Integer "34"
p Rational 6
p String 22


p "12".to_i
p 12.5.to_i
p nil.to_i

p 12.to_f
p "11".to_f
p nil.to_f

p "12".to_i
p "13".to_f
p "12".to_r
p "13".to_c

p "Jane".to_sym

#mac dinh la String.split(" ")
v = "Ruby Python Tcl PHP Perl".split
p v.class

for index in 0..v.length
  puts v[index]
end

#Chuyen String thanh char Array
string = "Ruby Python Tcl PHP Perl"
charArray = string.chars.to_a
p charArray
p string.split("")
