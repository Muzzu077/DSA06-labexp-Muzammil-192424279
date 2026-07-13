# Experiment 16: Patient Health Risk Analysis
# Course: Data Handling and Visualization

# Dataset
df16 <- data.frame(
  Patient_ID = paste0("P", 1:5),
  Age = c(25, 40, 55, 35, 60),
  BMI = c(22, 28, 30, 26, 32),
  BP = c(120, 135, 145, 130, 150),
  Cholesterol = c(180, 210, 240, 200, 260)
)

cat("--- Experiment 16: Patient Health Risk Analysis ---\n")
print(df16)

# Q1: Create a scatterplot matrix for Age, BMI, BP, and Cholesterol.
png("outputs/exp16_q1_scatterplot_matrix.png", width=800, height=800)
pairs(df16[, 2:5], col="darkblue", pch=19, main="Scatterplot Matrix of Health Indicators")
dev.off()

# Q2: Construct a Q-Q plot and ECDF for Cholesterol levels.
png("outputs/exp16_q2_qq_ecdf.png", width=1000, height=500)
par(mfrow=c(1,2))
qqnorm(df16$Cholesterol, col="red", pch=19, main="Normal Q-Q Plot of Cholesterol")
qqline(df16$Cholesterol, col="blue")
plot(ecdf(df16$Cholesterol), col="darkgreen", main="ECDF of Cholesterol")
dev.off()

# Q3: Create a bar chart showing the average values of each health indicator.
indicator_means <- colMeans(df16[, 2:5])
png("outputs/exp16_q3_bar_chart.png", width=800, height=600)
barplot(indicator_means, col=c("cadetblue", "tomato", "salmon", "gold"),
        ylab="Average Value", main="Average of Patient Health Indicators",
        names.arg=c("Age (yrs)", "BMI", "BP (mmHg)", "Cholesterol (mg/dL)"))
dev.off()
cat("Insight: A strong correlation is shown across all variables with age. Older patients in this dataset have higher BMI, BP, and Cholesterol levels.\n")

# Q4: Develop a Tableau dashboard simulation.
png("outputs/exp16_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
barplot(indicator_means, col=c("cadetblue", "tomato", "salmon", "gold"),
        ylab="Average Value", main="Averages Dashboard Element",
        names.arg=c("Age", "BMI", "BP", "Chol"))
plot(df16$Age, df16$Cholesterol, col="red", pch=19, cex=1.5,
     xlab="Age", ylab="Cholesterol", main="Age vs Cholesterol")
dev.off()
cat("Experiment 16 successfully completed. Plots saved to outputs/.\n\n")
