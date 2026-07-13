# Experiment 27: Energy Plant Monitoring
# Course: Data Handling and Visualization

# Dataset
df27 <- data.frame(
  PlantID = 1:5,
  Output = c(120, 150, 100, 170, 110),
  Temperature = c(65, 70, 60, 75, 62),
  Status = c("Active", "Active", "Maintenance", "Active", "Maintenance")
)

cat("--- Experiment 27: Energy Plant Monitoring ---\n")
print(df27)

# Q29: Create a histogram of power output.
png("outputs/exp27_q29_histogram.png", width=800, height=600)
hist(df27$Output, col="gold", main="Power Output Histogram", xlab="Output (MW)", ylab="Frequency")
dev.off()

# Q30: Generate a pie chart of plant status.
png("outputs/exp27_q30_pie_chart.png", width=800, height=600)
pie(table(df27$Status), col=c("forestgreen", "darkorange"), main="Plant Status Distribution")
dev.off()

# Q31: Build a bar chart of temperatures by plant.
png("outputs/exp27_q31_bar_chart.png", width=800, height=600)
barplot(df27$Temperature, names.arg=paste("Plant", df27$PlantID), col="cadetblue", main="Temperatures by Plant", ylab="Temp (C)", xlab="Plant ID")
dev.off()

# Q32: Create a scatter plot of output vs temperature.
png("outputs/exp27_q32_scatter_plot.png", width=800, height=600)
plot(df27$Output, df27$Temperature, col="magenta", pch=19, cex=1.5, main="Output vs Temperature", xlab="Output (MW)", ylab="Temp (C)")
grid()
dev.off()
cat("Experiment 27 successfully completed. Plots saved to outputs/.\n\n")
