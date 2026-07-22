# Experiment 5: Website Analytics
# Course: Data Handling and Visualization

# Dataset
dates <- as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05"))
page_views <- c(1500, 1600, 1400, 1650, 1800)
ctr <- c(0.023, 0.027, 0.020, 0.024, 0.026)
df5 <- data.frame(Date = dates, PageViews = page_views, ClickThroughRate = ctr)

cat("--- Experiment 5: Website Analytics ---\n")
print(df5)

# Q1: Create a line chart to visualize the trend in daily page views over time.
png("outputs/exp5_q1_line_chart.png", width=800, height=600)
plot(df5$Date, df5$PageViews, type="b", col="darkred", pch=19, lwd=2,
     xlab="Date", ylab="Page Views", main="Daily Page Views Trend")
grid()
dev.off()

# Q2: Generate a bar chart showing the top N days with the highest click-through rates.
sorted_df5 <- df5[order(-df5$ClickThroughRate), ]
png("outputs/exp5_q2_bar_chart.png", width=800, height=600)
barplot(sorted_df5$ClickThroughRate * 100, names.arg=format(sorted_df5$Date, "%b-%d"), 
        col="darkcyan", xlab="Date", ylab="Click-through Rate (%)", 
        main="Days Sorted by Click-through Rate")
dev.off()

# Q3: Develop a stacked area chart to display the distribution of user interactions (likes, shares, comments).
likes <- c(120, 130, 110, 140, 150)
shares <- c(30, 35, 25, 40, 45)
comments <- c(15, 20, 12, 22, 25)
interactions <- rbind(Likes = likes, Shares = shares, Comments = comments)
png("outputs/exp5_q3_stacked_bar.png", width=800, height=600)
barplot(interactions, names.arg=format(df5$Date, "%m/%d"), col=c("lightblue", "orange", "lightgreen"),
        legend=rownames(interactions), xlab="Date", ylab="Interactions Count", 
        main="Distribution of User Interactions")
dev.off()

# Q4: Develop a Tableau dashboard simulation.
png("outputs/exp5_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
plot(df5$Date, df5$PageViews, type="b", col="darkred", pch=19, lwd=2,
     xlab="Date", ylab="Page Views", main="Daily Page Views Trend")
barplot(sorted_df5$ClickThroughRate * 100, names.arg=format(sorted_df5$Date, "%b-%d"), 
        col="darkcyan", xlab="Date", ylab="Click-through Rate (%)", 
        main="CTR (%) by Day")
dev.off()
cat("Experiment 5 successfully completed. Plots saved to outputs/.\n\n")
