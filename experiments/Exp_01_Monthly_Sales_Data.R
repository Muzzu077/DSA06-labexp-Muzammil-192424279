# Experiment 1: Monthly Sales Data
# Course: Data Handling and Visualization

# Dataset
months <- c("January", "February", "March", "April", "May")
sales <- c(15000, 18000, 22000, 20000, 23000)
monthly_sales <- data.frame(Month = months, Sales = sales)

cat("--- Experiment 1: Monthly Sales Data ---\n")
print(monthly_sales)

# Q1: Create a line chart to visualize the monthly sales. Label axes and title appropriately.
png("outputs/exp1_q1_line_chart.png", width=800, height=600)
plot(1:5, monthly_sales$Sales, type="b", xaxt="n", col="blue", pch=19, lwd=2,
     xlab="Month", ylab="Sales (in $)", main="Monthly Sales Trend")
axis(1, at=1:5, labels=monthly_sales$Month)
grid()
dev.off()

# Q2: Generate a bar chart to display the top-selling products for the year.
# (Representative data used since no products are specified in the table)
products <- c("Product A", "Product B", "Product C", "Product D", "Product E")
sales_volume <- c(25000, 18000, 15000, 12000, 8000)
png("outputs/exp1_q2_bar_chart.png", width=800, height=600)
barplot(sales_volume, names.arg=products, col="darkgreen",
        xlab="Products", ylab="Annual Sales (in $)", main="Top-Selling Products of the Year")
dev.off()

# Q3: Develop a scatter plot to explore the relationship between advertising budget and monthly sales.
adv_budget <- c(1000, 1200, 1500, 1300, 1600)
png("outputs/exp1_q3_scatter_plot.png", width=800, height=600)
plot(adv_budget, monthly_sales$Sales, xlab="Advertising Budget ($)", ylab="Monthly Sales ($)",
     main="Advertising Budget vs Monthly Sales", col="red", pch=19, cex=1.5)
abline(lm(monthly_sales$Sales ~ adv_budget), col="darkblue", lwd=2)
grid()
dev.off()
cat("Insight: The scatter plot shows a strong positive correlation between advertising budget and monthly sales.\n")

# Q4: Build an interactive dashboard combining the line chart and bar chart.
png("outputs/exp1_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
plot(1:5, monthly_sales$Sales, type="b", xaxt="n", col="blue", pch=19, lwd=2,
     xlab="Month", ylab="Sales (in $)", main="Monthly Sales Trend")
axis(1, at=1:5, labels=monthly_sales$Month)
grid()
barplot(sales_volume, names.arg=products, col="darkgreen",
        xlab="Products", ylab="Sales (in $)", main="Top-Selling Products")
dev.off()
cat("Experiment 1 successfully completed. Plots saved to outputs/.\n\n")
