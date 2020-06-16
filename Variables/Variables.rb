tree_name = "pine"
$car_name = "Peugeot"
@sea_name = "Black sea"
@@species = "Cat"
@@species1 = "Dog"

p local_variables
#luu tat ca cac bien cuc bo vao mang p
p global_variables.include? :$car_name
# luu tat ca cac bien toan cuc vao mang p va kiem tra xem co bien $car_name trong no hay khong
p self.instance_variables
#luu tat ca cac instance vao mang p
p Object.class_variables
#luu tat ca cac doi tuong vao mang p
#
#
#
#
x = 5
def method1
  x = 10
  p x
end

method1
