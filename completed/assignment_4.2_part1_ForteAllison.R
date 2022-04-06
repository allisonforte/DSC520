# Assignment: ASSIGNMENT 4
# Name: Forte, Allison
# Date: 2022-04-08


library(ggplot2)
scores_df <- read.csv('documents/GitHub/DSC520/data/scores.csv', stringsAsFactors = FALSE)


## What are the observational units in this study?
## In this study the observational units are the 2 sections, the sports section and the regular section. 


## Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?
## In this experiment the variables are the scores (quantitative) that students achieved in their section. 
## For data we are provided with the section (one of the 2 categorical observational units) and the number of students who achieved specific scores ranging from 200 to 395 (quantitative). 


## Create one variable to hold a subset of your data set that contains only the Regular Section.
regular_scores <- subset(scores_df, Section == 'Regular')
regular_scores


## Create one variable to hold a subset of your data set that contains only the Sports Section.
sports_scores <- subset(scores_df, Section == 'Sports')
sports_scores


## Use the Plot function to plot each Sections scores and the number of students achieving that score. 
## Use additional Plot Arguments to label the graph and give each axis an appropriate label. 

## Regular only
plot(regular_scores$Score, regular_scores$Count, xlab = 'Score', ylab = 'Count', 
     main = 'Count of scores: Regular section')

## Sports only
plot(sports_scores$Score, sports_scores$Count, xlab = 'Score', ylab = 'Count', 
     main = 'Count of scores: Sports section')

## Combined
plot(regular_scores$Score, regular_scores$Count, xlab = 'Score', ylab = 'Count', 
     main = 'Count of scores: Combined', sub = 'red = regular, blue = sports', col = 
       'red') + points(sports_scores$Score, sports_scores$Count, col = 'dark blue')

## With your plots, answer the following questions:
## Comparing and contrasting the point distributions between the two section, looking at both tendency and consistency.
## Can you say that one section tended to score more points than the other? Justify and explain your answer.
## Students in the regular section tended to score more points than students in the sports section.
## We can see from the plot that there is a higher count of upper scores in the regular section. 
## For example, 40 total students scored the 2 highest scores in the regular section while 20 total students scored the 2 highest scores in the sports section.

## Did every student in one section score more points than every student in the other section? 
## If not, explain what a statistical tendency means in this context.
## The scores from the 2 sections overlapped each other indicating that not every student from one section scored more points than every student in the other section.
## Statistical tendency describes how well data can be represented by the mean, median, or mode. 
## In this case the data can be represented by these measures but the range has to be taken into consideration.
## While the mode of 'Regular' is higher than either of the 2 modes for 'Sports' this does not indicate that everyone in 'Regular' scored higher than all in 'Sports'.
## Additionally, while the mean does indicate that 'Regular' scores were overall higher than 'Sports', not every student scored higher. 
## Knowing that the ranges overlap, helps us know that no one section outperformed the other across the board. 

## What could be one additional variable that was not mentioned in the narrative that could be influencing the point distributions between the two sections?
## A variable not mentioned could be the time of the class. If one class took place early and one late that could explain some of the differences. 
## Another vaiable could be the experience level of the students. If the sports section atracted individuals wiith a different background, it could explain some of the differences. 
