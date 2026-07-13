# Experiment 14: Energy Consumption Analysis
# Course: Data Handling and Visualization

# Dataset import
df14 <- read.csv("data/Energy_Consumption_Data.csv")
cat("--- Experiment 14: Energy Consumption Analysis ---\n")
print(df14)

# Q1: Plot a histogram and density plot for Units_Consumed.
png("outputs/exp14_q1_hist_density.png", width=800, height=600)
hist(df14$Units_Consumed, probability=TRUE, col="lightyellow", 
     xlab="Units Consumed (kWh)", ylab="Density", main="Units Consumed Distribution")
lines(density(df14$Units_Consumed), col="red", lwd=2)
dev.off()

# Q2: Create a scatter plot between Temperature and Units_Consumed. Represent Peak_Hours using bubble size.
png("outputs/exp14_q2_scatter_bubble.png", width=800, height=600)
plot(df14$Temperature, df14$Units_Consumed, cex=df14$Peak_Hours/2, 
     col=rgb(0.7, 0.1, 0.5, 0.6), pch=16,
     xlab="Temperature (C)", ylab="Units Consumed (kWh)", 
     main="Temperature vs Units Consumed (Bubble = Peak Hours)")
grid()
dev.off()

# Q3: Calculate average Renewable_Usage for each Sector. Create a bar chart.
sec_avg_ren <- aggregate(Renewable_Usage ~ Sector, data=df14, mean)
print(sec_avg_ren)
png("outputs/exp14_q3_bar_chart.png", width=800, height=600)
barplot(sec_avg_ren$Renewable_Usage, names.arg=sec_avg_ren$Sector, col=c("forestgreen", "darkcyan", "brown"),
        xlab="Sector", ylab="Average Renewable Usage (%)", main="Renewable Energy Usage by Sector")
dev.off()
cat("Insight: Residential sector has the highest average renewable usage (23.5%), followed by Commercial (19.0%) and Industrial (13.5%).\n")

# Q4: Develop a Tableau dashboard simulation.
png("outputs/exp14_q4_dashboard_simulation.png", width=1200, height=600)
par(mfrow=c(1,2))
barplot(sec_avg_ren$Renewable_Usage, names.arg=sec_avg_ren$Sector, col=c("forestgreen", "darkcyan", "brown"),
        xlab="Sector", ylab="Average Renewable Usage (%)", main="Renewable Usage")
plot(df14$Temperature, df14$Units_Consumed, cex=df14$Peak_Hours/2, 
     col=rgb(0.7, 0.1, 0.5, 0.6), pch=16,
     xlab="Temp (C)", ylab="Units", main="Temp vs Units")
dev.off()
cat("Experiment 14 successfully completed. Plots saved to outputs/.\n\n")
