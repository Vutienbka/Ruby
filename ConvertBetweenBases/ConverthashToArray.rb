
a3 = { "apple"=>1, "banana"=>2, ["orange", "seedless"]=>3 }

# Su dung cach nay
b3 = a3.each{ |key, value| a3[key] = *value }
puts b3

#Cach nay kha phuc tap
c3 = a3.collect { |key, value| [key, a3[key].collect { |key1,value1| [key1,value1]}] }.collect { |e,f| [e => f] }
puts c3
