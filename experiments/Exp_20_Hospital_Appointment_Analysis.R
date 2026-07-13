# Experiment 20: Hospital Appointment Analysis
# Course: Data Handling and Visualization

# Dataset
df20 <- data.frame(
  PatientID = 1:5,
  Age = c(25, 40, 35, 50, 29),
  WaitingTime = c(2, 5, 1, 7, 3),
  Status = c("Attended", "Missed", "Attended", "Missed", "Attended")
)

cat("--- Experiment 20: Hospital Appointment Analysis ---\n")
print(df20)

# Q1: Create a histogram showing patient ages.
png("outputs/exp20_q1_histogram.png", width=800, height=600)
hist(df20$Age, col="lightblue", main="Patient Ages Histogram", xlab="Age", ylab="Frequency")
dev.off()

# Q2: Generate a pie chart for appointment status distribution.
png("outputs/exp20_q2_pie_chart.png", width=800, height=600)
pie(table(df20$Status), col=c("lightgreen", "tomato"), main="Appointment Status Distribution")
dev.off()

# Q3: Build a bar chart of waiting times by patient.
png("outputs/exp20_q3_bar_chart.png", width=800, height=600)
barplot(df20$WaitingTime, names.arg=paste("P", df20$PatientID), col="cyan", main="Waiting Time by Patient", ylab="Days", xlab="Patient")
dev.off()

# Q4: Create a scatter plot of age vs waiting time.
png("outputs/exp20_q4_scatter_plot.png", width=800, height=600)
plot(df20$Age, df20$WaitingTime, col="red", pch=19, cex=1.5, main="Age vs Waiting Time", xlab="Age", ylab="Waiting Days")
grid()
dev.off()
cat("Experiment 20 successfully completed. Plots saved to outputs/.\n\n")
