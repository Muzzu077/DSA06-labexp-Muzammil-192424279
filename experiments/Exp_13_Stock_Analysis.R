# Experiment 13: Stock Analysis
# Course: Data Handling and Visualization

# Dataset
df13 <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03")),
  StockA = c(100, 105, 110),
  StockB = c(150, 152, 148),
  StockC = c(120, 118, 122)
)

cat("--- Experiment 13: Stock Analysis ---\n")
print(df13)

# Q1: Create a line chart to visualize the stock prices of three companies.
png("outputs/exp13_q1_line_chart.png", width=800, height=600)
plot(df13$Date, df13$StockA, type="b", col="red", ylim=c(90, 160), pch=19, lwd=2,
     xlab="Date", ylab="Stock Price ($)", main="Stock Price Comparison")
lines(df13$Date, df13$StockB, type="b", col="green", pch=18, lwd=2)
lines(df13$Date, df13$StockC, type="b", col="blue", pch=17, lwd=2)
legend("topleft", legend=c("Stock A", "Stock B", "Stock C"), col=c("red", "green", "blue"), lty=1, pch=c(19,18,17))
grid()
dev.off()

# Q2: Generate a bar chart showing the daily percentage change in stock prices for Stock A.
change_A <- c(0, (105-100)/100, (110-105)/105) * 100
png("outputs/exp13_q2_bar_chart.png", width=800, height=600)
barplot(change_A[2:3], names.arg=c("Day 1-2", "Day 2-3"), col="purple",
        xlab="Trading Interval", ylab="Percentage Change (%)", main="Daily Percentage Change for Stock A")
dev.off()

# Q3: Build a table to display the stock price data for each company.
# (Printed to console above)

# Q4: Develop a Tableau dashboard simulation.
png("outputs/exp13_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
plot(df13$Date, df13$StockA, type="b", col="red", ylim=c(90, 160), pch=19, lwd=2,
     xlab="Date", ylab="Price ($)", main="Stock Comparison")
lines(df13$Date, df13$StockB, type="b", col="green", pch=18)
lines(df13$Date, df13$StockC, type="b", col="blue", pch=17)
barplot(change_A[2:3], names.arg=c("Day 1-2", "Day 2-3"), col="purple",
        xlab="Interval", ylab="Change (%)", main="Stock A Daily Change")
dev.off()
cat("Experiment 13 successfully completed. Plots saved to outputs/.\n\n")
