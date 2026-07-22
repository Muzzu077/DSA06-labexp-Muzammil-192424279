# Experiment 6: Product Sales Analysis
# Course: Data Handling and Visualization

# Dataset
prod_names_6 <- c("Product A", "Product B", "Product C")
jan_sales <- c(2000, 1500, 1200)
feb_sales <- c(2200, 1800, 1400)
mar_sales <- c(2400, 1600, 1100)
df6 <- data.frame(ProductID = 1:3, Name = prod_names_6, January = jan_sales, February = feb_sales, March = mar_sales)

cat("--- Experiment 6: Product Sales Analysis ---\n")
print(df6)

# Q1: Create a grouped bar chart to visualize the sales of each product for the first quarter.
sales_matrix <- as.matrix(df6[, c("January", "February", "March")])
rownames(sales_matrix) <- df6$Name
png("outputs/exp6_q1_grouped_bar.png", width=800, height=600)
barplot(sales_matrix, beside=TRUE, col=c("cornflowerblue", "chartreuse3", "coral"),
        legend=rownames(sales_matrix), xlab="Month", ylab="Sales Units", 
        main="Product Sales for Q1 (Grouped)")
dev.off()

# Q2: Generate a stacked area chart to represent the overall sales trend for all products.
png("outputs/exp6_q2_stacked_bar.png", width=800, height=600)
barplot(sales_matrix, col=c("cornflowerblue", "chartreuse3", "coral"),
        legend=rownames(sales_matrix), xlab="Month", ylab="Cumulative Sales Units", 
        main="Overall Sales Trend (Q1)")
dev.off()

# Q3: Build a table to show the monthly sales data for each product.
# (Already printed to console above)

# Q4: Develop a Tableau dashboard simulation.
png("outputs/exp6_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
barplot(sales_matrix, beside=TRUE, col=c("cornflowerblue", "chartreuse3", "coral"),
        xlab="Month", ylab="Sales Units", main="Product Sales for Q1 (Grouped)")
barplot(sales_matrix, col=c("cornflowerblue", "chartreuse3", "coral"),
        xlab="Month", ylab="Cumulative Sales Units", main="Overall Sales Trend (Q1)")
dev.off()
cat("Experiment 6 successfully completed. Plots saved to outputs/.\n\n")
