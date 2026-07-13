# Experiment 29: Water Quality Monitoring
# Course: Data Handling and Visualization

# Dataset
df29 <- data.frame(
  SampleID = 1:5,
  pH = c(7.2, 6.8, 7.5, 6.5, 7.1),
  Turbidity = c(3, 5, 2, 7, 4),
  Quality = c("Good", "Fair", "Good", "Poor", "Fair")
)

cat("--- Experiment 29: Water Quality Monitoring ---\n")
print(df29)

# Q37: Create a histogram of pH levels.
png("outputs/exp29_q37_histogram.png", width=800, height=600)
hist(df29$pH, col="cyan", main="pH Levels Histogram", xlab="pH", ylab="Frequency")
dev.off()

# Q38: Generate a pie chart of water quality categories.
png("outputs/exp29_q38_pie_chart.png", width=800, height=600)
pie(table(df29$Quality), col=c("beige", "green", "red"), main="Water Quality Distribution")
dev.off()

# Q39: Build a bar chart of turbidity by sample.
png("outputs/exp29_q39_bar_chart.png", width=800, height=600)
barplot(df29$Turbidity, names.arg=paste("S", df29$SampleID), col="brown", main="Turbidity by Sample", ylab="Turbidity", xlab="Sample ID")
dev.off()

# Q40: Create a scatter plot of pH level vs turbidity.
png("outputs/exp29_q40_scatter_plot.png", width=800, height=600)
plot(df29$pH, df29$Turbidity, col="darkgreen", pch=19, cex=1.5, main="pH vs Turbidity", xlab="pH", ylab="Turbidity")
grid()
dev.off()
cat("Experiment 29 successfully completed. Plots saved to outputs/.\n\n")
