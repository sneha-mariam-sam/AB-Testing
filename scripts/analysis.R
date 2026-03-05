# Load necessary libraries
library(tidyverse)

# Load the dataset
data <- read.csv('email_campaign_dataset.csv')

# Convert necessary columns to appropriate data types
data$subject_len <- as.numeric(as.character(data$subject_len))
data$click_rate <- as.numeric(as.character(data$click_rate))

# Create binary grouping variables
data$subject_length_category <- ifelse(data$subject_len < median(data$subject_len), "Short", "Long")
data$subject_length_category <- as.factor(data$subject_length_category)

data$is_weekend <- as.factor(data$is_weekend)
data$is_personalised <- as.factor(data$is_personalised)
data$is_discount <- as.factor(data$is_discount)

# Perform t-tests
t_test_weekend <- t.test(click_rate ~ is_weekend, data = data)
t_test_personalised <- t.test(click_rate ~ is_personalised, data = data)
t_test_discount <- t.test(click_rate ~ is_discount, data = data)

# Perform ANOVA
anova_times_of_day <- aov(click_rate ~ times_of_day, data = data)

# Perform Tukey's HSD test
tukey_times_of_day <- TukeyHSD(anova_times_of_day)

# Print results
print("T-test for Click Rate vs. is_weekend")
print(t_test_weekend)

print("T-test for Click Rate vs. is_personalised")
print(t_test_personalised)

print("T-test for Click Rate vs. is_discount")
print(t_test_discount)

print("ANOVA for Click Rate vs. times_of_day")
print(summary(anova_times_of_day))

print("Tukey's HSD Test for Click Rate vs. times_of_day")
print(tukey_times_of_day)
