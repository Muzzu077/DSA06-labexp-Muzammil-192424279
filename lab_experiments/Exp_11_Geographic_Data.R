# Experiment 11: Geographic Data
# Course: Data Handling and Visualization

# Dataset
df11 <- data.frame(
  City = c("City A", "City B", "City C"),
  Population = c(500000, 700000, 600000),
  Avg_Temperature = c(75, 68, 80),
  Elevation = c(1000, 800, 1200)
)

cat("--- Experiment 11: Geographic Data ---\n")
print(df11)

# Q1: Create a map chart to visualize the distribution of cities.
png("outputs/exp11_q1_map_chart.png", width=800, height=600)
plot(df11$Elevation, df11$Population, xlim=c(700, 1300), ylim=c(400000, 800000),
     xlab="Elevation (m)", ylab="Population", main="City Distribution Map (Elevation vs Population)",
     pch=19, col="darkblue", cex=2)
text(df11$Elevation, df11$Population, labels=df11$City, pos=3, col="red")
grid()
dev.off()

# Q2: Generate a scatter plot to explore the relationship between average temperature and population size.
png("outputs/exp11_q2_scatter_plot.png", width=800, height=600)
plot(df11$Avg_Temperature, df11$Population, xlab="Average Temperature (F)", ylab="Population",
     main="Average Temperature vs Population Size", col="orange", pch=15, cex=2)
abline(lm(df11$Population ~ df11$Avg_Temperature), col="grey")
grid()
dev.off()
cat("Insight: City C has the highest temperature (80 F) but mid-sized population. City B has the largest population (700,000) and lowest average temperature (68 F).\n")

# Q3: Build a table to display the geographic data for each city.
# (Printed to console above)

# Q4: Develop a Tableau dashboard simulation.
png("outputs/exp11_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
plot(df11$Elevation, df11$Population, xlab="Elevation", ylab="Population", main="Coordinates Map Proxy")
text(df11$Elevation, df11$Population, labels=df11$City, pos=3)
plot(df11$Avg_Temperature, df11$Population, xlab="Temperature (F)", ylab="Population", main="Temp vs Pop")
dev.off()
cat("Experiment 11 successfully completed. Plots saved to outputs/.\n\n")
