# Experiment 9: Survey Responses Analysis
# Course: Data Handling and Visualization

# Dataset
df9 <- data.frame(
  SurveyID = 1:3,
  Question1 = c("A", "B", "C"),
  Question2 = c("B", "A", "A"),
  Question3 = c("C", "D", "B")
)

cat("--- Experiment 9: Survey Responses Analysis ---\n")
print(df9)

# Q1: Create a grouped bar chart to visualize the distribution of answers for Question 1.
q1_counts <- table(df9$Question1)
png("outputs/exp9_q1_bar_chart.png", width=800, height=600)
barplot(q1_counts, col="lavender", xlab="Answer Choice", ylab="Count", main="Response Distribution for Question 1")
dev.off()

# Q2: Generate a stacked bar chart to represent the overall distribution of responses for all three questions.
options_list <- c("A", "B", "C", "D")
q_matrix <- matrix(0, nrow=4, ncol=3)
rownames(q_matrix) <- options_list
colnames(q_matrix) <- c("Question 1", "Question 2", "Question 3")
for (o in options_list) {
  q_matrix[o, 1] <- sum(df9$Question1 == o)
  q_matrix[o, 2] <- sum(df9$Question2 == o)
  q_matrix[o, 3] <- sum(df9$Question3 == o)
}
png("outputs/exp9_q2_stacked_bar.png", width=800, height=600)
barplot(q_matrix, col=c("salmon", "lightblue", "lightgreen", "yellow"), legend=rownames(q_matrix),
        xlab="Questions", ylab="Frequency", main="Overall Response Distribution across Questions")
dev.off()

# Q3: Build a table to show the survey response data for each survey.
# (Printed to console above)

# Q4: Develop a Tableau dashboard simulation.
png("outputs/exp9_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
barplot(q1_counts, col="lavender", xlab="Answer Choice", ylab="Count", main="Question 1 Distribution")
barplot(q_matrix, col=c("salmon", "lightblue", "lightgreen", "yellow"),
        xlab="Questions", ylab="Frequency", main="All Questions Response Distribution")
dev.off()
cat("Experiment 9 successfully completed. Plots saved to outputs/.\n\n")
