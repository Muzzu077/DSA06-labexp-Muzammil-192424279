# Experiment 8: Online Learning Activity Analysis
# Course: Data Handling and Visualization

# Q1: Import the dataset in R. Plot a histogram for Quiz_Score. Draw a boxplot of Quiz_Score by Course.
df8 <- read.csv("data/Online_Learning_Activity.csv")
cat("--- Experiment 8: Online Learning Activity Analysis ---\n")
print(df8)

png("outputs/exp8_q1_hist_boxplot.png", width=1000, height=500)
par(mfrow=c(1,2))
hist(df8$Quiz_Score, col="skyblue", xlab="Quiz Score", ylab="Frequency", main="Quiz Score Distribution")
boxplot(Quiz_Score ~ Course, data=df8, col=c("lightgreen", "coral"), 
        xlab="Course", ylab="Quiz Score", main="Quiz Score by Course")
dev.off()

# Q2: Create a scatter plot between Study_Time and Quiz_Score. Represent Videos_Watched using bubble size. Apply transparency.
png("outputs/exp8_q2_scatter_bubble.png", width=800, height=600)
plot(df8$Study_Time, df8$Quiz_Score, cex=df8$Videos_Watched/3, 
     col=rgb(0.1, 0.6, 0.3, 0.6), pch=16, 
     xlab="Study Time (hrs)", ylab="Quiz Score", 
     main="Study Time vs Quiz Score (Bubble Size = Videos Watched)")
text(df8$Study_Time, df8$Quiz_Score, labels=df8$Student_ID, pos=3, cex=0.8)
grid()
dev.off()
cat("Learning Pattern: The bubble plot shows that students who study longer generally achieve higher quiz scores and tend to watch more videos.\n")

# Q3: Convert Login_Date into Date format. Calculate the average quiz score per month. Plot a line chart. Apply moving average smoothing.
df8$Date_Obj <- as.Date(df8$Login_Date, "%Y-%m-%d")
df8$Month <- format(df8$Date_Obj, "%Y-%m")
monthly_avg <- aggregate(Quiz_Score ~ Month, data=df8, mean)

# Moving average smoothing (Window = 2)
moving_avg <- numeric(nrow(monthly_avg))
for (i in 1:nrow(monthly_avg)) {
  if (i == 1) {
    moving_avg[i] <- monthly_avg$Quiz_Score[i]
  } else {
    moving_avg[i] <- (monthly_avg$Quiz_Score[i] + monthly_avg$Quiz_Score[i-1]) / 2
  }
}
monthly_avg$Smoothed_Quiz_Score <- moving_avg
print(monthly_avg)

png("outputs/exp8_q3_monthly_trend.png", width=800, height=600)
plot(1:nrow(monthly_avg), monthly_avg$Quiz_Score, type="b", xaxt="n", col="blue", pch=19,
     xlab="Month", ylab="Average Quiz Score", main="Monthly Quiz Score Trend & Moving Avg", ylim=c(60, 95))
lines(1:nrow(monthly_avg), monthly_avg$Smoothed_Quiz_Score, type="b", col="red", lty=2, pch=15)
axis(1, at=1:nrow(monthly_avg), labels=monthly_avg$Month)
legend("bottomleft", legend=c("Raw Average", "2-Month Moving Avg"), col=c("blue", "red"), lty=c(1,2), pch=c(19,15))
grid()
dev.off()

# Q4: Simple interactive dashboard simulation.
png("outputs/exp8_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
boxplot(Quiz_Score ~ Course, data=df8, col=c("lightgreen", "coral"), 
        xlab="Course", ylab="Quiz Score", main="Quiz Score by Course")
plot(df8$Study_Time, df8$Quiz_Score, cex=df8$Videos_Watched/3, 
     col=rgb(0.1, 0.6, 0.3, 0.6), pch=16, 
     xlab="Study Time (hrs)", ylab="Quiz Score", main="Study Time vs Quiz Score")
dev.off()
cat("Experiment 8 successfully completed. Plots saved to outputs/.\n\n")
