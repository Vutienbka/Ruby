
a3 = [ ['apple', 1], ['banana', 2], [['orange','seedless'], 3] ]

# Cach 1
b3 = Hash[a3.map { |key, value|  [key, value]}]
puts b3
# Cach 2
c3 = Hash[a3.collect { |key, value| [key, value] }]
puts c3

