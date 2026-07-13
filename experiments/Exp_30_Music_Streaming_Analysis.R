# Experiment 30: Music Streaming Analysis
# Course: Data Handling and Visualization

# Dataset
df30 <- data.frame(
  SongID = 1:5,
  Duration = c(3.5, 4.2, 3.8, 5.0, 4.1),
  Streams = c(150, 200, 180, 250, 170),
  Genre = c("Pop", "Rock", "Pop", "Hip-Hop", "Rock")
)

cat("--- Experiment 30: Music Streaming Analysis ---\n")
print(df30)

# Q1: Create a histogram of song durations.
png("outputs/exp30_q1_histogram.png", width=800, height=600)
hist(df30$Duration, col="lavender", main="Song Durations Histogram", xlab="Duration (min)", ylab="Frequency")
dev.off()

# Q2: Generate a pie chart of genre distribution.
png("outputs/exp30_q2_pie_chart.png", width=800, height=600)
pie(table(df30$Genre), col=c("gold", "cyan", "pink"), main="Genre Distribution")
dev.off()

# Q3: Build a bar chart of average streams by genre.
genre_streams <- aggregate(Streams ~ Genre, data=df30, mean)
print(genre_streams)
png("outputs/exp30_q3_bar_chart.png", width=800, height=600)
barplot(genre_streams$Streams, names.arg=genre_streams$Genre, col="darkmagenta", main="Avg Streams by Genre (000s)", ylab="Streams", xlab="Genre")
dev.off()

# Q4: Create a scatter plot of duration vs streams.
png("outputs/exp30_q4_scatter_plot.png", width=800, height=600)
plot(df30$Duration, df30$Streams, col="orange", pch=19, cex=1.5, main="Duration vs Streams", xlab="Duration (min)", ylab="Streams (000s)")
grid()
dev.off()
cat("Experiment 30 successfully completed. Plots saved to outputs/.\n\n")
