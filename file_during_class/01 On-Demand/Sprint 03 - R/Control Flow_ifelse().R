## Control Flow
# =if() in google sheet

score <- 49

ifelse(score >= 80, "Passed", "Failed")

## ifelse ซ้อน

ifelse(score >= 90, "Passed", ifelse(score >=50, "OK","Enroll Again"))
