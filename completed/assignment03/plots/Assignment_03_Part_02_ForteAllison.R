# Assignment: ASSIGNMENT 3 PART 2
# Name: Forte, Allison
# Date: 2022-03-29


#### Load the ggplot2 package
install.packages('ggplot2')
install.packages("pastecs")
library(ggplot2)

## Read data from 'http://content.bellevue.edu/cst/dsc/520/id/resources/acs-14-1yr-s0201.csv'
survey2014_df <- read.csv('http://content.bellevue.edu/cst/dsc/520/id/resources/acs-14-1yr-s0201.csv')

## What are the elements in your data (including the categories and data types)?
## This data set includes 8 categories. These categories are 'Id',	'Id2',	
## 'Geography',	'PopGroupID',	'POPGROUP.display-label',	'RacesReported',	
## 'HSDegree', and	'BachDegree'. 

## Provide the output from the following functions: str(); nrow(); ncol()
str(survey2014_df)
nrow(survey2014_df)
ncol(survey2014_df)

## Create a Histogram of the HSDegree variable using the ggplot2 package.
ggplot(survey2014_df, aes(HSDegree)) + geom_histogram()
## Set a bin size for the Histogram.
ggplot(survey2014_df, aes(HSDegree)) + geom_histogram(aes(y = ..density..), bins = 10)
## Include a Title and appropriate X/Y axis labels on your Histogram Plot.
labeled_histogram <- ggplot(survey2014_df, aes(HSDegree)) + geom_histogram(aes(y = ..density..), bins = 10) + ggtitle('High School Degree Percentage by Geographic Region') + xlab('High School Degree Percent') + ylab('Density')
labeled_histogram
## Answer the following questions based on the Histogram produced:
## Based on what you see in this histogram, is the data distribution unimodal? Yes, the data appears to be unimodal.
## Is it approximately symmetrical? The data distribution is not symmetrical.
## Is it approximately bell-shaped? The data distribution is not bell-shaped.
## Is it approximately normal? The data distribution is not normal.
## If not normal, is the distribution skewed? If so, in which direction? The data distribution is negatively skewed. 

## Include a normal curve to the Histogram that you plotted.
labeled_histogram + stat_function(fun = dnorm, args = list(mean = mean(survey2014_df$HSDegree, na.rm = TRUE), sd = sd(survey2014_df$HSDegree, na.rm = TRUE)), colour = 'black', size = 1)

## Explain whether a normal distribution can accurately be used as a model for this data.
## Based on the normal curve with the given mean and standard deviation of this data it does appear to follow a normal distribution and therefore a normal distribution can be used to model this data. 
## With this data one must consider than HSDegree is measured as a percentage so can never be over 100%.

## Create a Probability Plot of the HSDegree variable.
qplot(sample = survey2014_df$HSDegree)

## Answer the following questions based on the Probability Plot:
## Based on what you see in this probability plot, is the distribution approximately normal? 
## The distribution of this data is approximately normal.

## Explain how you know.
## One can conclude the data is close to normal not not exactly normal because the Probability Plat graphs points close to the 'ideal' diagonal line but not exactly on it. 

## If not normal, is the distribution skewed? If so, in which direction? 
## By analyzing the probability plot line we can see the data is in fact slightly negatively skewed.

## Explain how you know.
## We can tell the data is slightly negatively skewed because the points deviated away from the 'ideal' diagonal line generally above where the ideal diagonal line would be.  

## Now that you have looked at this data visually for normality, you will quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.
library(pastecs)
stat.desc(survey2014_df[c('HSDegree')], basic = FALSE, norm = TRUE)

## In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. Explain how a change in the sample size may change your explanation.
## In normal distributions the skew and kurtosis will be equal to 0. In this description we can see neither the skew nor kurtosis are equal to 0 confirming that this is not a normal distribution.
## The relatively high value of kurtosis indicated that our data is fairly pointy and has heavy tails.
## The negative skew value indicates that we have more data points on the left side of our mean indicating that our data is negatively skewed. 
## The skew.2SE and kurt.2SE values are the z-scores which are useful because they allow us to compare the skew and kurtosis of this data set with the values from other data sets that use different measures.
## These values also allow us to know how likely is it for our skew and kurtosis values to occur. Because the values of both are above 1.96 and our p value is .05 we know our results are significant. 
## As our sample size increases the standard error will decrease. This means that the z values will become less meaningful as the sample size increases. As the sample size increases we must rely more heavily on the visual analysis of the graph. 