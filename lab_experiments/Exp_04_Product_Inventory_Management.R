# Experiment 4: Product Inventory Management
# Course: Data Handling and Visualization

# Dataset
prod_ids <- 1:5
prod_names <- c("Product A", "Product B", "Product C", "Product D", "Product E")
qty_avail <- c(250, 175, 300, 200, 220)
df4 <- data.frame(ProductID = prod_ids, Name = prod_names, Quantity = qty_avail)

cat("--- Experiment 4: Product Inventory Management ---\n")
print(df4)

# Q1: Create a bar chart to visualize the quantity of each product in the inventory.
png("outputs/exp4_q1_bar_chart.png", width=800, height=600)
barplot(df4$Quantity, names.arg=df4$Name, col="purple", xlab="Products", 
        ylab="Quantity Available", main="Product Inventory Levels")
dev.off()

# Q2: Generate a stacked bar chart to show the quantity of each product within different categories.
categories <- c("Electronics", "Clothing", "Electronics", "Appliances", "Clothing")
cat_inventory <- matrix(c(250, 0, 0,  # Product A
                          0, 175, 0,  # Product B
                          300, 0, 0,  # Product C
                          0, 0, 200,  # Product D
                          0, 220, 0), # Product E
                        nrow=3, ncol=5)
colnames(cat_inventory) <- prod_names
rownames(cat_inventory) <- c("Electronics", "Clothing", "Appliances")
png("outputs/exp4_q2_stacked_bar.png", width=800, height=600)
barplot(cat_inventory, col=c("cyan", "gold", "pink"), legend=rownames(cat_inventory),
        xlab="Products", ylab="Quantity", main="Product Quantity by Category")
dev.off()

# Q3: Build a scatter plot to explore the relationship between product price and quantity available.
prices <- c(25, 15, 40, 30, 20)
png("outputs/exp4_q3_scatter_plot.png", width=800, height=600)
plot(prices, df4$Quantity, xlab="Product Price ($)", ylab="Quantity Available",
     main="Product Price vs Quantity Available", col="darkgreen", pch=17, cex=1.5)
abline(lm(df4$Quantity ~ prices), col="red", lwd=1.5)
grid()
dev.off()
cat("Insight: Product C has the highest price ($40) and highest quantity (300), showing no negative correlation between price and stock level here.\n")

# Q4: Develop a Tableau dashboard simulation.
png("outputs/exp4_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
barplot(df4$Quantity, names.arg=df4$Name, col="purple", xlab="Products", 
        ylab="Quantity Available", main="Product Inventory Levels")
barplot(cat_inventory, col=c("cyan", "gold", "pink"),
        xlab="Products", ylab="Quantity", main="Product Quantity by Category")
dev.off()
cat("Experiment 4 successfully completed. Plots saved to outputs/.\n\n")
