# Experiment 26: Restaurant Orders Analysis
# Course: Data Handling and Visualization

# Dataset
df26 <- data.frame(
  OrderID = 1:5,
  ItemsOrdered = c(2, 5, 3, 4, 2),
  BillAmount = c(25, 60, 35, 50, 20),
  DiningType = c("Dine-In", "Takeaway", "Dine-In", "Delivery", "Takeaway")
)

cat("--- Experiment 26: Restaurant Orders Analysis ---\n")
print(df26)

# Q25: Create a histogram of bill amounts.
png("outputs/exp26_q25_histogram.png", width=800, height=600)
hist(df26$BillAmount, col="khaki", main="Bill Amounts Histogram", xlab="Bill ($)", ylab="Frequency")
dev.off()

# Q26: Generate a pie chart of dining types.
png("outputs/exp26_q26_pie_chart.png", width=800, height=600)
pie(table(df26$DiningType), col=c("tomato", "skyblue", "lightgrey"), main="Dining Type Distribution")
dev.off()

# Q27: Build a bar chart of items ordered by order.
png("outputs/exp26_q27_bar_chart.png", width=800, height=600)
barplot(df26$ItemsOrdered, names.arg=paste("Order", df26$OrderID), col="darkcyan", main="Items Ordered by Order", ylab="Items", xlab="Order ID")
dev.off()

# Q28: Create a scatter plot of items ordered vs bill amount.
png("outputs/exp26_q28_scatter_plot.png", width=800, height=600)
plot(df26$ItemsOrdered, df26$BillAmount, col="red", pch=19, cex=1.5, main="Items vs Bill Amount", xlab="Items Ordered", ylab="Bill ($)")
grid()
dev.off()
cat("Experiment 26 successfully completed. Plots saved to outputs/.\n\n")
