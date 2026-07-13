# Experiment 23: Airline Passenger Analysis
# Course: Data Handling and Visualization

# Dataset
df23 <- data.frame(
  PassengerID = 1:5,
  Age = c(28, 45, 33, 52, 39),
  FlightHours = c(2, 8, 5, 10, 6),
  Satisfaction = c("High", "Medium", "High", "Low", "Medium")
)

cat("--- Experiment 23: Airline Passenger Analysis ---\n")
print(df23)

# Q13: Create a histogram of passenger ages.
png("outputs/exp23_q13_histogram.png", width=800, height=600)
hist(df23$Age, col="gold", main="Passenger Ages Histogram", xlab="Age", ylab="Frequency")
dev.off()

# Q14: Generate a pie chart of satisfaction levels.
png("outputs/exp23_q14_pie_chart.png", width=800, height=600)
pie(table(df23$Satisfaction), col=c("tomato", "green", "yellow"), main="Satisfaction Distribution")
dev.off()

# Q15: Build a bar chart of flight hours by passenger.
png("outputs/exp23_q15_bar_chart.png", width=800, height=600)
barplot(df23$FlightHours, names.arg=paste("P", df23$PassengerID), col="blue", main="Flight Hours by Passenger", ylab="Hours", xlab="Passenger ID")
dev.off()

# Q16: Create a scatter plot of age vs flight hours.
png("outputs/exp23_q16_scatter_plot.png", width=800, height=600)
plot(df23$Age, df23$FlightHours, col="brown", pch=19, cex=1.5, main="Age vs Flight Hours", xlab="Age", ylab="Flight Hours")
grid()
dev.off()
cat("Experiment 23 successfully completed. Plots saved to outputs/.\n\n")
