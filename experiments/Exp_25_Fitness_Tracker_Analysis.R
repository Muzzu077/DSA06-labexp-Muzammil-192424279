# Experiment 25: Fitness Tracker Analysis
# Course: Data Handling and Visualization

# Dataset
df25 <- data.frame(
  UserID = 1:5,
  Steps = c(7000, 10000, 8500, 12000, 6500),
  CaloriesBurned = c(250, 400, 320, 500, 220),
  ActiveMinutes = c(40, 60, 50, 75, 35)
)

cat("--- Experiment 25: Fitness Tracker Analysis ---\n")
print(df25)

# Q21: Create a histogram of daily steps.
png("outputs/exp25_q21_histogram.png", width=800, height=600)
hist(df25$Steps, col="lightgreen", main="Daily Steps Histogram", xlab="Steps", ylab="Frequency")
dev.off()

# Q22: Generate a pie chart of activity level categories.
act_cat <- ifelse(df25$Steps < 8000, "Moderate", ifelse(df25$Steps < 11000, "Active", "Highly Active"))
png("outputs/exp25_q22_pie_chart.png", width=800, height=600)
pie(table(act_cat), col=c("orange", "red", "green"), main="Activity Level Categories")
dev.off()

# Q23: Build a bar chart of calories burned by user.
png("outputs/exp25_q23_bar_chart.png", width=800, height=600)
barplot(df25$CaloriesBurned, names.arg=paste("U", df25$UserID), col="salmon", main="Calories Burned by User", ylab="Calories", xlab="User ID")
dev.off()

# Q24: Create a scatter plot of steps vs calories burned.
png("outputs/exp25_q24_scatter_plot.png", width=800, height=600)
plot(df25$Steps, df25$CaloriesBurned, col="darkblue", pch=19, cex=1.5, main="Steps vs Calories Burned", xlab="Steps", ylab="Calories")
grid()
dev.off()
cat("Experiment 25 successfully completed. Plots saved to outputs/.\n\n")
