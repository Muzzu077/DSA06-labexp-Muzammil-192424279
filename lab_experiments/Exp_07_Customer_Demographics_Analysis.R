# Experiment 7: Customer Demographics Analysis
# Course: Data Handling and Visualization

# Dataset
df7 <- data.frame(
  CustomerID = 1:3,
  Age = c(28, 35, 42),
  Gender = c("Female", "Male", "Female"),
  Income = c(50000, 60000, 75000)
)

cat("--- Experiment 7: Customer Demographics Analysis ---\n")
print(df7)

# Q1: Create a bar chart to visualize the distribution of customer ages.
png("outputs/exp7_q1_bar_chart.png", width=800, height=600)
barplot(df7$Age, names.arg=paste("Cust", df7$CustomerID), col="khaki", 
        xlab="Customer ID", ylab="Age", main="Distribution of Customer Ages")
dev.off()

# Q2: Generate a pie chart to represent the distribution of customers by gender.
gender_table <- table(df7$Gender)
png("outputs/exp7_q2_pie_chart.png", width=800, height=600)
pie(gender_table, col=c("pink", "lightblue"), main="Gender Distribution")
dev.off()

# Q3: Build a table to show the demographic information for each customer.
# (Printed to console above)

# Q4: Develop a Tableau dashboard simulation.
png("outputs/exp7_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
barplot(df7$Age, names.arg=paste("Cust", df7$CustomerID), col="khaki", 
        xlab="Customer ID", ylab="Age", main="Distribution of Customer Ages")
pie(gender_table, col=c("pink", "lightblue"), main="Gender Distribution")
dev.off()
cat("Experiment 7 successfully completed. Plots saved to outputs/.\n\n")
