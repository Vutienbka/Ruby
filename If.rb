a = 12
b = 24
c = 36

if a > b
  puts "a greater than b"
elsif a == b
  puts "a is equal b"
else
  puts "b greater than a"
end

if a + b > c and a + c > b and b + c > a
  puts "this is a normal triangle"
else
  puts "this is not a triangle"
end

k ={:a => "hhhhh", :b=> "d"}
for index in 0..k.length do
  puts k.at(index)
end
