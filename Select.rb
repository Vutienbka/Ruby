[1,2,3,4,5,6,7,8,9,10].select { |a| print(a) if a <= 10 }
print("\n")
[1,2,3,4,5,6].select { |n| puts(n) if n.even? }

even_numbers = []
[1,2,3,4,5,6].each do |n|
  if n.even?
    even_numbers << n
  end
end
