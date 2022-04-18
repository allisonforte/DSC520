# Assignment: ASSIGNMENT Week 5
# Name: Forte, Allison
# Date: 2022-04-18


# Using either the same dataset(s) you used in the previous weeks’ exercise 
# (or a brand-new dataset of your choosing), perform the following transformations 

library(xlsx)
housing_df <- read.xlsx('documents/GitHub/DSC520/data/week-7-housing.xlsx', sheetName = 'Sheet2')


# Using the dplyr package analyze/transform the data. 
# This isn’t just modifying data, you are learning about your data.
# Play around and start to understand your dataset in more detail)

install.packages('tidyverse')
library(dplyr)

# GroupBy and Summarise
housing_df %>%
  group_by(current_zoning) %>%
  summarise(avg = mean(sq_ft_lot))

housing_df %>%
  group_by(bedrooms) %>%
  summarise(mean(square_feet_total_living))

# Mutate, GroupBy, and Summarise
housing_df %>%
  mutate(home_age = 2022-year_built) %>%
  group_by(home_age) %>%
  summarise(mean(Sale.Price))

# Filter, GroupBy, and Summarize
housing_df %>%
  filter(Sale.Price > 2000000) %>%
  group_by(bedrooms) %>%
  summarize(mean(Sale.Price))

# Select, GroupBy, and Summarize
housing_df %>%
  select(zip5, Sale.Price) %>%
  group_by(zip5) %>%
  summarize(mean(Sale.Price))

# Arrange 
housing_df %>%
  arrange(desc(Sale.Price))

housing_df %>%
  arrange(Sale.Price)

housing_df %>%
  arrange(sale_warning) %>%
  group_by(sale_warning) %>%
  count()


# Use the cbind and rbind function on your dataset
# Add new column with price per sq ft for each entry
price_per_sqft <- (housing_df$Sale.Price/housing_df$square_feet_total_living)
housing_df %>%
  cbind(price_per_sqft)


# Add new entry to DF with rbind
new_entry <- list(as.Date(2006-04-17, origin = "2006-04-17"), 599000,1,3, NA,'R1','1872 Main st', 98052, NA, 'REDMOND', NA, NA, 10, 2750, 3, 3, 0, 0, 2005, 0, 'R4', 12800, 'R', 2)
housing_df_2 <- housing_df
rbind(housing_df_2, new_entry)


# Split a string, then concatenate the results back together
library(dplyr)
library(tidyr)

housing_df2 <- strsplit(housing_df$addr_full, " ")
house_number <- sapply(housing_df2, "[[", 1)
cbind(housing_df, house_number)


