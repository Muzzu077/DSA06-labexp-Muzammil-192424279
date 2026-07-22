# Experiment 2: Customer Feedback Analysis
# Course: Data Handling and Visualization

# Dataset
cust_ids <- 1:5
cust_ages <- c(25, 30, 35, 28, 40)
cust_satisfaction <- c(4, 5, 3, 4, 5)
df2 <- data.frame(CustomerID = cust_ids, Age = cust_ages, SatisfactionScore = cust_satisfaction)

cat("--- Experiment 2: Customer Feedback Analysis ---\n")
print(df2)

# Q1: Create a histogram to represent the distribution of customer ages.
png("outputs/exp2_q1_histogram.png", width=800, height=600)
hist(df2$Age, col="orange", xlab="Customer Age", ylab="Frequency", 
     main="Distribution of Customer Ages", breaks=5)
dev.off()

# Q2: Generate a pie chart to display the overall distribution of customer satisfaction scores.
sat_table <- table(df2$SatisfactionScore)
png("outputs/exp2_q2_pie_chart.png", width=800, height=600)
pie(sat_table, labels=paste("Score", names(sat_table), "(", sat_table, ")"), 
    col=rainbow(length(sat_table)), main="Distribution of Satisfaction Scores")
dev.off()

# Q3: Build a stacked bar chart to visualize the distribution of customer satisfaction scores by age group.
age_group <- ifelse(df2$Age < 30, "Under 30", "30 & Over")
sat_age_table <- table(df2$SatisfactionScore, age_group)
png("outputs/exp2_q3_stacked_bar.png", width=800, height=600)
barplot(sat_age_table, col=c("red", "yellow", "green"), legend=rownames(sat_age_table),
        xlab="Age Group", ylab="Count of Responses", 
        main="Satisfaction Scores by Age Group", args.legend=list(title="Satisfaction Score"))
dev.off()

# Q4: Develop a word cloud from open-ended customer feedback.
feedback_words <- c("great", "service", "satisfied", "happy", "product", "average", "quality", "excellent", "support", "good")
feedback_freqs <- c(8, 7, 6, 5, 5, 4, 4, 3, 3, 2)
png("outputs/exp2_q4_wordcloud.png", width=800, height=600)
plot(1, type="n", xlim=c(0, 10), ylim=c(0, 10), xaxt='n', yaxt='n', ann=FALSE)
set.seed(123)
for (i in 1:length(feedback_words)) {
  text(runif(1, 2, 8), runif(1, 2, 8), feedback_words[i], cex=feedback_freqs[i]/2, col=rainbow(10)[i])
}
title("Prevalent Customer Sentiments (Word Cloud)")
dev.off()
cat("Experiment 2 successfully completed. Plots saved to outputs/.\n\n")
