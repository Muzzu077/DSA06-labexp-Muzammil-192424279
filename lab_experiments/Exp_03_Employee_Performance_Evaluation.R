# Experiment 3: Employee Performance Evaluation
# Course: Data Handling and Visualization

# Dataset
emp_ids <- 1:5
departments <- c("Sales", "HR", "Marketing", "Sales", "HR")
service_years <- c(5, 3, 7, 4, 2)
perf_scores <- c(85, 92, 78, 90, 76)
df3 <- data.frame(EmployeeID = emp_ids, Department = departments, YearsOfService = service_years, PerformanceScore = perf_scores)

cat("--- Experiment 3: Employee Performance Evaluation ---\n")
print(df3)

# Q1: Create a line chart to visualize the performance trend of employees over time.
png("outputs/exp3_q1_line_chart.png", width=800, height=600)
plot(df3$EmployeeID, df3$PerformanceScore, type="b", col="darkblue", pch=15, lwd=2,
     xlab="Employee ID", ylab="Performance Score", main="Employee Performance Trend")
legend("bottomleft", legend="Performance", col="darkblue", lty=1, pch=15)
dev.off()

# Q2: Generate a bar chart showing the distribution of employees across different departments.
dept_counts <- table(df3$Department)
png("outputs/exp3_q2_bar_chart.png", width=800, height=600)
barplot(dept_counts, col=c("lightblue", "lightgreen", "lightpink"), 
        xlab="Department", ylab="Number of Employees", main="Employee Distribution by Department")
dev.off()

# Q3: Build a scatter plot to analyze the correlation between years of service and performance scores.
png("outputs/exp3_q3_scatter_plot.png", width=800, height=600)
plot(df3$YearsOfService, df3$PerformanceScore, xlab="Years of Service", ylab="Performance Score",
     main="Years of Service vs Performance Score", col="magenta", pch=19, cex=1.5)
abline(lm(df3$PerformanceScore ~ df3$YearsOfService), col="black", lty=2)
grid()
dev.off()
cat("Insight: The scatter plot suggests no simple positive linear correlation between service length and performance score in this dataset.\n")

# Q4: Develop a Tableau dashboard simulation.
png("outputs/exp3_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
plot(df3$EmployeeID, df3$PerformanceScore, type="b", col="darkblue", pch=15, lwd=2,
     xlab="Employee ID", ylab="Performance Score", main="Performance Trend")
barplot(dept_counts, col=c("lightblue", "lightgreen", "lightpink"), 
        xlab="Department", ylab="Employees", main="Department Distribution")
dev.off()
cat("Experiment 3 successfully completed. Plots saved to outputs/.\n\n")
