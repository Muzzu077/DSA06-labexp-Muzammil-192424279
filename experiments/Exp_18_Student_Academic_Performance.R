# Experiment 18: Student Academic Performance
# Course: Data Handling and Visualization

# Dataset
df18 <- data.frame(
  Student_ID = paste0("S", 1:5),
  Age = c(19, 21, 20, 22, 23),
  Study_Hours = c(12, 8, 15, 10, 7),
  Attendance = c(90, 70, 95, 85, 60),
  Test_Score = c(85, 70, 92, 80, 65),
  Participation_Score = c(8, 7, 9, 8, 6)
)

cat("--- Experiment 18: Student Academic Performance ---\n")
print(df18)

# Q1: Create a stacked area chart showing Test_Score and Participation_Score.
scores_matrix <- t(as.matrix(df18[, c("Test_Score", "Participation_Score")]))
colnames(scores_matrix) <- df18$Student_ID
png("outputs/exp18_q1_stacked_bar.png", width=800, height=600)
barplot(scores_matrix, col=c("skyblue", "gold"), legend=rownames(scores_matrix),
        xlab="Student ID", ylab="Combined Score Value", main="Test & Participation Scores by Student")
dev.off()

# Q2: Generate a boxplot of Study_Hours grouped by Attendance quartiles.
att_quartiles <- cut(df18$Attendance, breaks=c(0, 70, 85, 100), labels=c("Q1-Low", "Q2/Q3-Mid", "Q4-High"))
png("outputs/exp18_q2_boxplot.png", width=800, height=600)
boxplot(Study_Hours ~ att_quartiles, data=df18, col=c("lightpink", "yellow", "cyan"),
        xlab="Attendance Group", ylab="Study Hours", main="Study Hours by Attendance Group")
dev.off()

# Q3: Construct a density plot for Test_Score.
png("outputs/exp18_q3_density.png", width=800, height=600)
plot(density(df18$Test_Score), col="purple", lwd=3, main="Density Plot of Test Scores")
polygon(density(df18$Test_Score), col=rgb(0.7,0.3,0.9,0.3))
dev.off()

# Q4: Develop a Tableau dashboard simulation.
png("outputs/exp18_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
plot(df18$Study_Hours, df18$Test_Score, col="blue", pch=19, xlab="Study Hours", ylab="Test Score", main="Study Hours vs Test Score")
plot(density(df18$Test_Score), col="purple", lwd=3, main="Test Score Distribution")
dev.off()
cat("Experiment 18 successfully completed. Plots saved to outputs/.\n\n")
