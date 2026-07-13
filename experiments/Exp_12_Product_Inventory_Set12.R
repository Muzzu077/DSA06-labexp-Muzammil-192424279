# Experiment 12: Product Inventory Management
# Course: Data Handling and Visualization

# Dataset
df12 <- data.frame(
  ProductID = 1:3,
  Name = c("Product A", "Product B", "Product C"),
  Quantity = c(250, 175, 300),
  Price = c(20, 15, 18)
)

cat("--- Experiment 12: Product Inventory Management ---\n")
print(df12)

# Q1: Create a bar chart to visualize the quantity of each product in the inventory.
png("outputs/exp12_q1_bar_chart.png", width=800, height=600)
barplot(df12$Quantity, names.arg=df12$Name, col="gold", xlab="Product", ylab="Quantity", main="Inventory Quantities")
dev.off()

# Q2: Generate a stacked bar chart to show the quantity of each product within different categories.
df12_cat <- matrix(c(250, 0, 175, 0, 300, 0), nrow=2)
rownames(df12_cat) <- c("Category 1", "Category 2")
colnames(df12_cat) <- df12$Name
png("outputs/exp12_q2_stacked_bar.png", width=800, height=600)
barplot(df12_cat, col=c("forestgreen", "skyblue"), legend=rownames(df12_cat),
        xlab="Product", ylab="Quantity", main="Product Category Quantities Stacked")
dev.off()

# Q3: Build a table to show the inventory data for each product.
# (Printed to console above)

# Q4: Develop a Tableau dashboard simulation.
png("outputs/exp12_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
barplot(df12$Quantity, names.arg=df12$Name, col="gold", xlab="Product", ylab="Quantity", main="Quantities")
barplot(df12_cat, col=c("forestgreen", "skyblue"), xlab="Product", ylab="Quantity", main="Categories Stacked")
dev.off()
cat("Experiment 12 successfully completed. Plots saved to outputs/.\n\n")
