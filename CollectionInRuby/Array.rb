#Co the khai bao mot mang theo cu phap %w{}
alpha = %w{ a b c d e f g h}
#Phương thức inspect sẽ in các phần tử mảng trong cặp dấu [], mỗi phần tử ngăn cách nhau bởi dấu phẩy.
beta = alpha.inspect
puts beta


puts alpha.values_at(1..5).inspect

#phuong thuc slice giong het []
puts alpha.slice(0)
puts alpha.slice(-1)

#Phương thức sample có tác dụng lấy một hoặc một số phần tử tại vị trí bất kì.
puts alpha.sample
puts alpha.sample(3).inspect



