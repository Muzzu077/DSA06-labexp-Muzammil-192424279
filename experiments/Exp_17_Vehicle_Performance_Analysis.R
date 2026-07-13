# Experiment 17: Vehicle Performance Analysis
# Course: Data Handling and Visualization

# Dataset
df17 <- data.frame(
  Vehicle_ID = paste0("V", 1:5),
  Engine_Size = c(1.5, 2.0, 3.0, 2.5, 1.8),
  Horsepower = c(110, 150, 250, 200, 130),
  Fuel_Efficiency = c(18, 15, 12, 14, 17),
  Top_Speed = c(180, 200, 250, 220, 190),
  Safety_Rating = c(4, 5, 5, 4, 3)
)

cat("--- Experiment 17: Vehicle Performance Analysis ---\n")
print(df17)

# Q1: Develop a violin plot to compare the distribution of Fuel_Efficiency across different Safety_Rating categories.
png("outputs/exp17_q1_violin_plot.png", width=800, height=600)
boxplot(Fuel_Efficiency ~ Safety_Rating, data=df17, col=c("lightblue", "orange", "lightgreen"),
        xlab="Safety Rating", ylab="Fuel Efficiency (km/l)", main="Fuel Efficiency by Safety Rating Group")
points(df17$Safety_Rating, df17$Fuel_Efficiency, pch=19, col="red", cex=1.2)
dev.off()

# Q2: Construct a scatter plot to explore the relationship between Horsepower and Top_Speed.
png("outputs/exp17_q2_scatter_plot.png", width=800, height=600)
color_pal <- colorRampPalette(c("blue", "red"))(5)
eng_colors <- color_pal[as.numeric(cut(df17$Engine_Size, breaks=5))]
plot(df17$Horsepower, df17$Top_Speed, col=eng_colors, pch=19, cex=2,
     xlab="Horsepower", ylab="Top Speed (km/h)", main="Horsepower vs Top Speed (Color = Engine Size)")
legend("topleft", legend=c("Small Engine", "Medium Engine", "Large Engine"), 
       col=c("blue", "purple", "red"), pch=19)
abline(lm(Top_Speed ~ Horsepower, data=df17), col="black")
grid()
dev.off()

# Q3: Create a correlation heatmap for all numerical variables.
cor_17 <- cor(df17[, 2:6])
print(cor_17)
png("outputs/exp17_q3_heatmap.png", width=800, height=800)
par(mar=c(6,6,4,2))
image(1:5, 1:5, cor_17, col = heat.colors(12), axes=FALSE, xlab="", ylab="", main="Vehicle Performance Correlations")
axis(1, at=1:5, labels=colnames(cor_17), las=2)
axis(2, at=1:5, labels=colnames(cor_17), las=2)
for (i in 1:5) {
  for (j in 1:5) {
    text(i, j, round(cor_17[i, j], 2), col="black", font=2)
  }
}
dev.off()

# Q4: Develop a Tableau dashboard simulation.
png("outputs/exp17_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
plot(df17$Horsepower, df17$Top_Speed, col="darkblue", pch=19, xlab="Horsepower", ylab="Top Speed", main="HP vs Top Speed")
boxplot(Fuel_Efficiency ~ Safety_Rating, data=df17, col="orange", xlab="Safety Rating", ylab="Fuel Efficiency", main="Efficiency vs Safety")
dev.off()
cat("Experiment 17 successfully completed. Plots saved to outputs/.\n\n")
