nameList = Hash.new

nameList.default =[]

nameList[:a] << 3
nameList[:b] << 5
nameList.default
puts(nameList[:a])

h = { :name => "Jane", :age => 17 }
print h.values
#In tung phan tu cua hash
puts "In ra cap key va value"
h.each { |key, value| print("key: #{key} value: #{value} \n" )}

#In ra moi key
puts "In ra chi key"
h.each_key { |key| print("key: #{key}\n")}

#In ra moi value
puts "In ra chi value"
h.each_value { |value| print("value: #{value}\n")}