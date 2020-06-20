# Hash co the lay bat ky doi tuong nao lam chi so key
nameList = Hash.new

nameList.default =[]

nameList[:a] << 3
nameList[:b] << 5
nameList.default
puts(nameList[:a])

h = { :name => "Jane", :age => 17 }
# In tat ca phan tu cua hash
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


# Khi truy cập bất kì key nào trong hash.
# nếu khóa có giá trị không tồn tại, hash sẽ trả về giá trị mặc định:
months = Hash.new("Month")
puts "#{months[0]}"
puts "#{months[2]}"

puts months


hash = Hash.new

hash[:a] = "Jane"
hash[2] = "Thomas"
hash[3] = "Robert"
hash[4] = "Julia"
hash[5] = "Rebecca"

puts "Hash size: #{ hash.size }"

c = hash.keys.inspect
puts "key of c: #{ c }"
puts hash.values.inspect
puts hash


#Sao chep hash
hash1 = hash.dup
puts "#{ hash1 }"
# Kiem tra hai hash co bang nhau hay khong
p hash.eql? hash1
#Kiem tra hash co rong hay khong
p hash.empty?

# Kiem tra co su ton tai cua cac phan tu trong hash hay khong
p hash.include? :a
p hash.has_key? :a
p hash.has_value? "Jane"
p hash.member? :a

hash.each do |key,value|
  if key.eql? :a
    p "#{key} " " #{value}"
  end
end

# Cach in phan tu trong mang bam
puts hash.fetch :a
puts hash[2]
puts hash.values_at :a

puts
def check checkKey, hash
  hash.each do |key,value|
    if hash.fetch(checkKey) == value
      p "#{key} " " #{value}"
      return hash[key]
    end
  end
end

puts "Ket qua tra ve: #{check(:a, hash)}"

#Tron mang bam
hash1 = Hash.new

hash1[1] = "Jane"
hash1[2] = "Thomas"

hash2 = Hash.new

hash2[3] = "Robert"
hash2[4] = "Julia"

hash = hash1.merge hash2
puts hash

hash = hash1.update hash2
puts hash

