#create our function

greeting <- function(name) {  
  print(paste("Hello World!", name))
}

greeting_def <- function(name = "Kong", age = 23) {  
  print(paste("Hello World!", name))
}

#name, age => 'parameter'
#"Kong", 23 => 'argument' (default argument) 

# เรียกใช้ function
# กรณีที่ใช้ function โดยไม่ป้อน argument จะคืนค่าเป็น default argument
# สามารถใส่ argument สลับตำแหน่งได้ แต่ต้องระบุชื่อ parameter
# เช่น greeting_def("Toy", 25) = greeting_def(age = 25, name = "Toy") != greeting_def(25, "Toy")