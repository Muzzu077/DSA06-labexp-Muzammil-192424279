# Experiment 21: Movie Ratings Analysis
# Course: Data Handling and Visualization

# Dataset
df21 <- data.frame(
  MovieID = 1:5,
  Genre = c("Action", "Comedy", "Drama", "Action", "Comedy"),
  Rating = c(4.5, 3.8, 4.2, 4.7, 3.5),
  Duration = c(120, 90, 140, 130, 95)
)

cat("--- Experiment 21: Movie Ratings Analysis ---\n")
print(df21)

# Q5: Create a histogram of movie ratings.
png("outputs/exp21_q5_histogram.png", width=800, height=600)
hist(df21$Rating, col="yellow", main="Movie Ratings Histogram", xlab="Rating", ylab="Frequency")
dev.off()

# Q6: Generate a pie chart showing genre distribution.
png("outputs/exp21_q6_pie_chart.png", width=800, height=600)
pie(table(df21$Genre), col=rainbow(3), main="Genre Distribution")
dev.off()

# Q7: Build a bar chart of average ratings by genre.
genre_rating_avg <- aggregate(Rating ~ Genre, data=df21, mean)
print(genre_rating_avg)
png("outputs/exp21_q7_bar_chart.png", width=800, height=600)
barplot(genre_rating_avg$Rating, names.arg=genre_rating_avg$Genre, col="orange", main="Avg Rating by Genre", ylab="Rating", xlab="Genre")
dev.off()

# Q8: Create a scatter plot of duration vs rating.
png("outputs/exp21_q8_scatter_plot.png", width=800, height=600)
plot(df21$Duration, df21$Rating, col="blue", pch=19, cex=1.5, main="Duration vs Rating", xlab="Duration (min)", ylab="Rating")
grid()
dev.off()
cat("Experiment 21 successfully completed. Plots saved to outputs/.\n\n")
