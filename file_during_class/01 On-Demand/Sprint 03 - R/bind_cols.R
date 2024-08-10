# bind_cols != JOIN เพราะ bind เป็นแค่การเอาข้อมูลมาต่อกัน
df1 <- data.frame(
  id = 1:5,
  name = c("John", "Marry", "Anna", "David", "Lisa")
)

df2 <- data.frame(
  city = c(rep("BKK", 3), rep("LONDON", 2)),
  country = c(rep("TH", 3), rep("UK", 2))
)

full_df = bind_cols(df1,df2)

##มีจุดอ่อน คือข้อมูลทั้ง 2 df ไม่มี key กำกับก็มาต่อกันได้ เราอาจจะรวมข้อมูลผิด

#ดังนั้น add key ให้ df2 ด้วย แล้วใช้ left_join() แทน ดีกว่า
df2 <- data.frame(
  id = 1:5,
  city = c(rep("BKK", 3), rep("LONDON", 2)),
  country = c(rep("TH", 3), rep("UK", 2))
)

full_df = left_join(df1, df2, by="id")
  