# Assignment: ASSIGNMENT Week 4 Part 2
# Name: Forte, Allison
# Date: 2022-04-08


install.packages("xlsx")
library(xlsx)

housing_df <- read.xlsx('documents/GitHub/DSC520/data/week-7-housing.xlsx', sheetName = 'Sheet2')
housing_df

## Using the Housing dataset, perform the following data transformations:
## Use the apply function on a variable in your dataset
avg_sale_price <- apply(housing_df['Sale.Price'], 2, mean)
avg_sale_price

## Use the aggregate function on a variable in your dataset
agg_zip <- aggregate(housing_df, by = list(housing_df$zip5), FUN = mean, na.rm = TRUE)
agg_zip

## Use the plyr function on a variable in your dataset: split  data, perform a modification, bring it back together
install.packages('plyr')
library(plyr)
new_housing_df <- ddply(housing_df, 'sq_ft_lot', mutate, 'acres' = sq_ft_lot / 43560)
new_housing_df

## Check distributions of the data
library(ggplot2)
hist_acres = ggplot(new_housing_df, aes(acres)) + geom_histogram(aes(y = ..density..), bins = 60) 
hist_acres

## The distribution of the lot size in acres in this data set ranges from 0.18 acres to 37.45 acres.

## Identify if there are any outliers
## Based on the analysis of the data, there are several outliers. 
## Out of the 12865 data points, only 17 entries have a lot size larger than 15 acres. 
## We could consider all of these entries outliers or refine our definition further to consider the 6 over 25 aces to be outliers. 
## The vast majority of our data falls under 10 acres.

## Create at least 2 new variables
## Age of home at sale
sale_year <- as.numeric(format(new_housing_df$Sale.Date, "%Y"))
age_at_sale <- sale_year - new_housing_df$year_built
with_age_housing_df <- cbind(new_housing_df, age_at_sale)
with_age_housing_df

## Price per sqft
price_per_sqft <- new_housing_df$Sale.Price / new_housing_df$square_feet_total_living
with_age_and_sqft_price_df <-cbind(with_age_housing_df, price_per_sqft)
with_age_and_sqft_price_df
