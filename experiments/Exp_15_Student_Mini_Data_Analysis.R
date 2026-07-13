# Experiment 15: Student Mini Data Analysis
# Course: Data Handling and Visualization

# Dataset import
df15 <- read.csv("data/Student_Mini_Data.csv")
cat("--- Experiment 15: Student Mini Data Analysis ---\n")
print(df15)

# Q1: Plot a histogram for Math_Score. Draw a boxplot of Science_Score by Gender.
png("outputs/exp15_q1_hist_boxplot.png", width=1000, height=500)
par(mfrow=c(1,2))
hist(df15$Math_Score, col="beige", xlab="Math Score", ylab="Frequency", main="Math Score Distribution")
boxplot(Science_Score ~ Gender, data=df15, col=c("pink", "lightblue"), 
        xlab="Gender", ylab="Science Score", main="Science Score by Gender")
dev.off()

# Q2: Create a scatter plot between Study_Hours and Math_Score. Use different colors for Gender. Add a regression line.
png("outputs/exp15_q2_scatter_regression.png", width=800, height=600)
plot(df15$Study_Hours, df15$Math_Score, col=ifelse(df15$Gender=="Male", "blue", "red"), pch=19, cex=1.5,
     xlab="Study Hours", ylab="Math Score", main="Study Hours vs Math Score by Gender")
legend("bottomright", legend=c("Female", "Male"), col=c("red", "blue"), pch=19)
abline(lm(Math_Score ~ Study_Hours, data=df15), col="black", lwd=2)
grid()
dev.off()
cat("Insight: Clear positive correlation shows that more study hours lead to higher math scores for both genders.\n")

# Q3: Convert Exam_Date into Date format. Calculate monthly average Math scores. Plot a line chart. Apply moving average smoothing.
df15$Date_Obj <- as.Date(df15$Exam_Date, "%Y-%m-%d")
df15$Month <- format(df15$Date_Obj, "%Y-%m")
monthly_math_avg <- aggregate(Math_Score ~ Month, data=df15, mean)

# Moving average (Window = 2)
ma_math <- numeric(nrow(monthly_math_avg))
for (i in 1:nrow(monthly_math_avg)) {
  if (i == 1) {
    ma_math[i] <- monthly_math_avg$Math_Score[i]
  } else {
    ma_math[i] <- (monthly_math_avg$Math_Score[i] + monthly_math_avg$Math_Score[i-1]) / 2
  }
}
monthly_math_avg$Smoothed_Math_Score <- ma_math
print(monthly_math_avg)

png("outputs/exp15_q3_monthly_trend.png", width=800, height=600)
plot(1:nrow(monthly_math_avg), monthly_math_avg$Math_Score, type="b", xaxt="n", col="darkgreen", pch=19,
     xlab="Month", ylab="Average Math Score", main="Monthly Math Score Trend", ylim=c(60, 80))
lines(1:nrow(monthly_math_avg), monthly_math_avg$Smoothed_Math_Score, type="b", col="orange", lty=2, pch=17)
axis(1, at=1:nrow(monthly_math_avg), labels=monthly_math_avg$Month)
legend("bottomright", legend=c("Raw Average", "Smoothed (MA-2)"), col=c("darkgreen", "orange"), lty=c(1,2), pch=c(19,17))
grid()
dev.off()

# Q4: Develop a Tableau dashboard simulation.
png("outputs/exp15_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
boxplot(Science_Score ~ Gender, data=df15, col=c("pink", "lightblue"), 
        xlab="Gender", ylab="Science Score", main="Science Score by Gender")
plot(df15$Study_Hours, df15$Math_Score, col=ifelse(df15$Gender=="Male", "blue", "red"), pch=19,
     xlab="Study Hours", ylab="Math Score", main="Study Hours vs Math Score")
dev.off()
cat("Experiment 15 successfully completed. Plots saved to outputs/.\n\n")
