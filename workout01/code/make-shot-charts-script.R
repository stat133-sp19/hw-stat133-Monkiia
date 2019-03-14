#title:make-shot-charts-script
#description: this code helps to create shot charts for the player data
#inputs: we need the 5 detailed csv raw data, a jpg background, and several packages(ggplot2,jpeg,grid)
#outputs: we output 5 players individual shots charts and a overall gsw shots chart


library(ggplot2)
library(grid)
library(jpeg)
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
df = rbind(curry,Iguodala,green,thompson,durant)
court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))
thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson') +
  theme_minimal()
pdf("../images/klay-thompson-shot-chart.pdf", width=6.5, height=5)
thompson_shot_chart
dev.off()
curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: stephen-curry') +
  theme_minimal()
pdf("../images/stephen-curry-shot-chart.pdf", width=6.5, height=5)
curry_shot_chart
dev.off()
durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: kevin-durant') +
  theme_minimal()
pdf("../images/kevin-durant-shot-chart.pdf", width=6.5, height=5)
durant_shot_chart
dev.off()
iguodala_shot_chart <- ggplot(data = Iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: andre-iguodala') +
  theme_minimal()
pdf("../images/andre-iguodala-shot-chart.pdf", width=6.5, height=5)
iguodala_shot_chart
dev.off()
green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: draymond-green') +
  theme_minimal()
pdf("../images/draymond-green-shot-chart.pdf", width=6.5, height=5)
green_shot_chart
dev.off()
df_shot_chart <- ggplot(data = df) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  theme_minimal()
pdf("../images/gsw-shot-chart.pdf", width=8, height=7)
df_shot_chart + facet_grid(. ~ name)
dev.off()
png("../images/gsw-shot-chart.png", width=800, height=700)
df_shot_chart + facet_grid(. ~ name)
dev.off()