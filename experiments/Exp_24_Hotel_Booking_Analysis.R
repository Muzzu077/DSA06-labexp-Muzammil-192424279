# Experiment 24: Hotel Booking Analysis
# Course: Data Handling and Visualization

# Dataset
df24 <- data.frame(
  BookingID = 1:5,
  StayNights = c(2, 5, 3, 7, 4),
  Guests = c(2, 4, 1, 3, 2),
  RoomType = c("Standard", "Deluxe", "Standard", "Suite", "Deluxe")
)

cat("--- Experiment 24: Hotel Booking Analysis ---\n")
print(df24)

# Q17: Create a histogram of stay nights.
png("outputs/exp24_q17_histogram.png", width=800, height=600)
hist(df24$StayNights, col="salmon", main="Stay Nights Histogram", xlab="Nights", ylab="Frequency")
dev.off()

# Q18: Generate a pie chart of room types.
png("outputs/exp24_q18_pie_chart.png", width=800, height=600)
pie(table(df24$RoomType), col=c("cyan", "pink", "beige"), main="Room Type Distribution")
dev.off()

# Q19: Build a bar chart of guests per booking.
png("outputs/exp24_q19_bar_chart.png", width=800, height=600)
barplot(df24$Guests, names.arg=paste("B", df24$BookingID), col="darkolivegreen", main="Guests per Booking", ylab="Guests", xlab="Booking ID")
dev.off()

# Q20: Create a scatter plot of guests vs stay nights.
png("outputs/exp24_q20_scatter_plot.png", width=800, height=600)
plot(df24$Guests, df24$StayNights, col="blue", pch=19, cex=1.5, main="Guests vs Stay Nights", xlab="Guests", ylab="Stay Nights")
grid()
dev.off()
cat("Experiment 24 successfully completed. Plots saved to outputs/.\n\n")
