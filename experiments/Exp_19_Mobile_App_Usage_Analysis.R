# Experiment 19: Mobile App Usage Analysis
# Course: Data Handling and Visualization

# Dataset import
df19 <- read.csv("data/Mobile_App_Usage.csv")
cat("--- Experiment 19: Mobile App Usage Analysis ---\n")
print(df19)

# Q1: Plot a histogram and density plot for Screen_Time.
png("outputs/exp19_q1_hist_density.png", width=800, height=600)
hist(df19$Screen_Time, probability=TRUE, col="pink", xlab="Screen Time (hrs)", ylab="Density", main="Screen Time Distribution")
lines(density(df19$Screen_Time), col="darkred", lwd=2.5)
dev.off()

# Q2: Create a scatter plot between Data_Used and Screen_Time. Calculate correlation.
png("outputs/exp19_q2_scatter_trend.png", width=800, height=600)
plot(df19$Screen_Time, df19$Data_Used, xlab="Screen Time (hrs)", ylab="Data Used (GB)",
     main="Screen Time vs Data Used", col="blue", pch=19, cex=1.5)
abline(lm(Data_Used ~ Screen_Time, data=df19), col="red", lwd=2)
grid()
r_val <- cor(df19$Screen_Time, df19$Data_Used)
text(4, 4, paste("r =", round(r_val, 3)), cex=1.2, font=2, col="darkred")
dev.off()
cat("Correlation coefficient r =", r_val, "\n")

# Q3: Find average Satisfaction score for each Gender. Create a bar chart.
gen_sat <- aggregate(Satisfaction ~ Gender, data=df19, mean)
print(gen_sat)
png("outputs/exp19_q3_bar_chart.png", width=800, height=600)
b_pts <- barplot(gen_sat$Satisfaction, names.arg=gen_sat$Gender, col=c("coral", "cornflowerblue"),
                 ylim=c(0, 6), xlab="Gender", ylab="Average Satisfaction Score", main="Average Satisfaction by Gender")
text(b_pts, gen_sat$Satisfaction + 0.3, labels=round(gen_sat$Satisfaction, 2), font=2)
dev.off()
cat("Insight: Female users show a higher average satisfaction score (4.67) than male users (2.67).\n")

# Q4: Develop a Tableau dashboard simulation.
png("outputs/exp19_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
plot(df19$Screen_Time, df19$Data_Used, col="blue", pch=19, xlab="Screen Time (hrs)", ylab="Data Used (GB)", main="Data vs Screen Time")
barplot(gen_sat$Satisfaction, names.arg=gen_sat$Gender, col=c("coral", "cornflowerblue"), main="Avg Satisfaction by Gender")
dev.off()
cat("Experiment 19 successfully completed. Plots saved to outputs/.\n\n")
