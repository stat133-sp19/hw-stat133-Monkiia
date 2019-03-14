#title:makeshotsdatascript
#description: this code helps to create txt summarys for the player data
#inputs: we need the 5 detailed csv raw data 
#outputs: we output 5 players individual shots data summary and a overall gsw shots data summary



curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
Iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry$name = "Stephen Curry"
Iguodala$name = "Andre Iguodala"
green$name = "Graymond Green"
durant$name = "Kevin Durant"
thompson$name = "Klay Thompson"
curry[curry=="y"] = "shot_yes"
curry[curry=="n"] = "shot_no"
durant[durant=="y"] = "shot_yes"
durant[durant=="n"] = "shot_no"
green[green=="y"] = "shot_yes"
green[green=="n"] = "shot_no"
Iguodala[Iguodala=="y"] = "shot_yes"
Iguodala[Iguodala=="n"] = "shot_no"
thompson[thompson=="y"] = "shot_yes"
thompson[thompson=="n"] = "shot_no"
curry$minute = curry$period *12 - curry$minutes_remaining
durant$minute = durant$period *12 - durant$minutes_remaining
thompson$minute = thompson$period *12 - thompson$minutes_remaining
Iguodala$minute = Iguodala$period *12 - Iguodala$minutes_remaining
green$minute = green$period *12 - green$minutes_remaining
sink('../output/andre-iguodala-summary.txt')
summary(Iguodala)
sink()
sink('../output/stephen-curry-summary.txt')
summary(curry)
sink()
sink('../output/kevin-durant-summary.txt')
summary(durant)
sink()
sink('../output/draymond-green-summary.txt.txt')
summary(green)
sink()
sink('../output/klay-thompson-summary.txt.txt')
summary(thompson)
sink()
df = rbind(curry,Iguodala,green,thompson,durant)
write.table(df, file = "../data/shots-data.csv", sep = ",",row.names = FALSE)
sink('../output/shots-data-summary.txt .txt')
summary(df)
sink()