# Experiment 28: Social Media Engagement Analysis
# Course: Data Handling and Visualization

# Dataset
df28 <- data.frame(
  PostID = 1:5,
  Likes = c(120, 200, 150, 300, 180),
  Comments = c(15, 30, 20, 40, 25),
  Shares = c(10, 20, 12, 35, 18)
)

cat("--- Experiment 28: Social Media Engagement Analysis ---\n")
print(df28)

# Q33: Create a histogram of likes.
png("outputs/exp28_q33_histogram.png", width=800, height=600)
hist(df28$Likes, col="lightpink", main="Post Likes Histogram", xlab="Likes", ylab="Frequency")
dev.off()

# Q34: Generate a pie chart of total engagement components.
total_eng <- c(Likes = sum(df28$Likes), Comments = sum(df28$Comments), Shares = sum(df28$Shares))
png("outputs/exp28_q34_pie_chart.png", width=800, height=600)
pie(total_eng, col=c("red", "lightblue", "green"), main="Engagement Components Share")
dev.off()

# Q35: Build a bar chart of comments by post.
png("outputs/exp28_q35_bar_chart.png", width=800, height=600)
barplot(df28$Comments, names.arg=paste("Post", df28$PostID), col="yellow", main="Comments by Post", ylab="Comments", xlab="Post ID")
dev.off()

# Q36: Create a scatter plot of likes vs shares.
png("outputs/exp28_q36_scatter_plot.png", width=800, height=600)
plot(df28$Likes, df28$Shares, col="darkblue", pch=19, cex=1.5, main="Likes vs Shares", xlab="Likes", ylab="Shares")
grid()
dev.off()
cat("Experiment 28 successfully completed. Plots saved to outputs/.\n\n")
