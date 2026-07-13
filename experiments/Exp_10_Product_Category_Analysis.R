# Experiment 10: Product Category Analysis
# Course: Data Handling and Visualization

# Dataset
df10 <- data.frame(
  Category = c("Electronics", "Clothing", "Appliances"),
  Sales = c(50000, 35000, 40000)
)

cat("--- Experiment 10: Product Category Analysis ---\n")
print(df10)

# Q1: Generate a funnel chart to analyze the sales conversion process for each category.
png("outputs/exp10_q1_funnel_chart.png", width=800, height=600)
sorted_df10 <- df10[order(-df10$Sales), ]
plot(1, type="n", xlim=c(-60000, 60000), ylim=c(0, 4), xaxt="n", yaxt="n", xlab="", ylab="", main="Sales Volume Funnel Chart")
for (i in 1:nrow(sorted_df10)) {
  w <- sorted_df10$Sales[i]
  rect(-w/2, 4-i-0.3, w/2, 4-i+0.3, col=rainbow(3)[i])
  text(0, 4-i, labels=paste(sorted_df10$Category[i], ": $", w), col="black", font=2)
}
dev.off()

# Q2: Build a table to display the sales data for each product category.
# (Printed to console above)

# Q3: Develop a Tableau dashboard simulation combining charts.
png("outputs/exp10_q3_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
pie(df10$Sales, labels=paste(df10$Category, "($", df10$Sales, ")"), col=c("red", "blue", "green"), main="Sales Share")
barplot(df10$Sales, names.arg=df10$Category, col=c("red", "blue", "green"), main="Sales by Category", ylab="Sales ($)")
dev.off()

# Q4: Create a pie chart to represent the distribution of sales across product categories.
png("outputs/exp10_q4_pie_chart.png", width=800, height=600)
pie(df10$Sales, labels=paste(df10$Category, "($", df10$Sales, ")"), 
    col=c("red", "blue", "green"), main="Sales Distribution by Category")
dev.off()
cat("Experiment 10 successfully completed. Plots saved to outputs/.\n\n")
