p :name
#Kiem tra kieu dung .class
p :name.class
#kich thuoc cua symbol
p :name.methods.size
#kich thuoc cua String
p "Jane".methods.size
#Symbol giống nhau thì có id giống nhau,

p :name.object_id
p :name.object_id
# string giống nhau thì lại có id khác nhau
p "name".object_id
p "name".object_id
#=> Dung Symbol se tiet kiem bo nho hon
#
#
# Symbol còn được dùng để làm khóa trong bảng băm
domains = {:sk => "Slovakia", :no => "Norway", :hu => "Hungary"}

puts domains[:sk]
puts domains[:no]
puts domains[:hu]