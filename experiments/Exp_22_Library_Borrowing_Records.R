# Experiment 22: Library Borrowing Records
# Course: Data Handling and Visualization

# Dataset
df22 <- data.frame(
  UserID = 1:5,
  BooksBorrowed = c(2, 5, 3, 6, 1),
  DaysKept = c(10, 25, 14, 30, 7),
  FineAmount = c(0, 15, 0, 20, 0)
)

cat("--- Experiment 22: Library Borrowing Records ---\n")
print(df22)

# Q9: Create a histogram of books borrowed.
png("outputs/exp22_q9_histogram.png", width=800, height=600)
hist(df22$BooksBorrowed, col="pink", main="Books Borrowed Histogram", xlab="Books", ylab="Frequency")
dev.off()

# Q10: Generate a pie chart for users with and without fines.
has_fine <- ifelse(df22$FineAmount > 0, "Fined", "No Fine")
png("outputs/exp22_q10_pie_chart.png", width=800, height=600)
pie(table(has_fine), col=c("coral", "lightgreen"), main="Users Fined vs Not Fined")
dev.off()

# Q11: Build a bar chart of fine amounts by user.
png("outputs/exp22_q11_bar_chart.png", width=800, height=600)
barplot(df22$FineAmount, names.arg=paste("User", df22$UserID), col="purple", main="Fine Amount by User", ylab="Fine ($)", xlab="User ID")
dev.off()

# Q12: Create a scatter plot of days kept vs fine amount.
png("outputs/exp22_q12_scatter_plot.png", width=800, height=600)
plot(df22$DaysKept, df22$FineAmount, col="darkgreen", pch=19, cex=1.5, main="Days Kept vs Fine Amount", xlab="Days Kept", ylab="Fine ($)")
grid()
dev.off()
cat("Experiment 22 successfully completed. Plots saved to outputs/.\n\n")
