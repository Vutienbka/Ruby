# map lấy tất cả các đối tượng, sử dụng chúng chạy biểu thức trong block
# và trả về mảng mới là kết quả sau khi chạy hết tất cả các phần tử của mảng đối với biểu thức trong block:
numberArray = [1,2,3,4,5,6,7,8,9,10]

#Hai function tren tuong duong nhau
[1,2,3,4,5,6,7,8,9,10].map{ |e| print(e) }
print("\n")

# print se khong co chen \n
[1,2,3,4,5,6,7,8,9,10].map{ |e| print(e*2) }
# puts thi se chen \n vao cuoi moi phan tu

# Su khac nhau giua each va map
def printNumber(numberArray)
  lovingNumber = []
  numberArray.each do |number|
    lovingNumber << "I love number: #{number}"
  end
  lovingNumber
end

def print(numberArray)
  numberArray.map do |number|
    "I love number: #{number}"
  end
end