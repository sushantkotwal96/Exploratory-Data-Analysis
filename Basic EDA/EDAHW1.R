#install.packages("reshape2")
library(reshape2)
#install.packages("ggplot2")
library(ggplot2)

data("tips")

# Storing the tips dataset
df2 = tips

# Adding the percent_tipped column to the existing dataset
per_tip = df2$tip/df2$total_bill

df2[,"Percent_Tipped"]= per_tip

df2


df2$Percent_Tipped = round(df2$tip/df2$total_bill, 2)*100

View(df2)


#Q.1) Plotting Tip Percentage
percent.gg = ggplot(df2,aes(x = Percent_Tipped)) + geom_histogram(bins = 30)
percent.gg + ggtitle("Distribution of Tip Percentage Data") + xlab("Percentage Tipped") + ylab("Frequency")
ggplot(df2,aes(x = Percent_Tipped)) + geom_density() + geom_rug() + facet_wrap(~ size, nrow = 2)

# Center of Distribution
median(df2$Percent_Tipped)
mean(df2$Percent_Tipped)

# Spread of Distribution - Mean Absolute Deviation
mad(df2$Percent_Tipped)

#Q.2) Plotting Tip Percentage for different Party Sizes
percent.gg + facet_wrap(~ size, nrow = 2) + ggtitle("Distribution of Tip Percentage Data for Different Party Sizes") + xlab("Percentage Tipped") + ylab("Frequency")

