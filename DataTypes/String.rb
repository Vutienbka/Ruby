p "Hello"
p 'Ruby'

p "Ruby".size
#Chuyen thuong thanh hoa
p "Ruby".upcase
#Chuyen hoa thanh thuong
p "Ruby and Python".downcase
#Viet hoa chu dau
p "Ruby and Python".capitalize
#Chuyen hoa thanh thuong va nguoc lai
p "Ruby and Python".swapcase

p 2.to_s

msg = "This is ruby on rails"
#Lay tung phan tu cua String
p msg["This"]
# Lay tu chuoi n ky tu tu vi tri i msg[i,n]
p msg[0,5]
p msg[0..5]

#Noi chuoi
p msg.concat(" programming","")