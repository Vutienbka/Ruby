#inject cũng cấp cho ta một biến số và cập nhập giá trị của biến số ấy
# sau mỗi phần tử của mảng được duyệt qua
number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

total = number.inject { |sum, e| sum + e}
# Sum se duoc gan phan tu dau tien, e se chay tu phan tu thu 2 cua mang
# 1 + 2 -> 3
# 3 + 3 -> 6
# 6 + 4 -> 10
# 10 + 5 -> 15
# 15 + 6 -> 21
# 21 + 7 -> 28
# 28 + 8 -> 36
# 36 + 9 = 45
# 45 + 10 = 55
# ket qua 55 se luu vao bien sum, ham inject se return sum -> total = sum
puts total
# total = 55

total = number.inject(10) { |sum, e| sum + e }
puts total

# Sum se duoc gan la gia tri 10, e se chay tu phan tu dau tien cua mang
# total = 65
#
#
string = %w{ a bb ccc }
total = string.inject(0){ |sum, str| sum + str.size }
puts total
# Sum se duoc gan la gia tri 0, str se chay tu phan tu dau tien cua mang
# 0 + 1 = 1
# 1 + 2 = 3
# 3 + 3 = 6
# sum = 6
# total = return sum