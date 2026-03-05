# Email Marketing Campaign A/B Testing Analysis

## Introduction
This project analyzes how different email campaign features affect click-through rates. Using statistical hypothesis testing in R, the analysis evaluates whether factors such as personalization, timing, and discounts significantly influence user engagement.

The goal is to identify which campaign strategies improve email performance and provide recommendations for optimizing marketing campaigns.

## Dataset
The dataset contains information about multiple email marketing campaigns and their performance metrics.

Source: Email Campaign Dataset
File: email_campaign_dataset.csv

Each record represents one campaign and includes features describing the structure and content of the email.

| Column               | Description                                             |
| -------------------- | ------------------------------------------------------- |
| `campaign_id`        | Unique identifier for each campaign                     |
| `sender`             | Identifier for the sender of the campaign               |
| `subject_len`        | Length of the email subject                             |
| `body_len`           | Length of the email body                                |
| `mean_paragraph_len` | Average length of paragraphs in the email body          |
| `day_of_week`        | Day of the week the email was sent                      |
| `is_weekend`         | 1 if the email was sent on a weekend, 0 otherwise       |
| `times_of_day`       | Time of day the email was sent (Morning, Noon, Evening) |
| `category`           | Category of the email campaign                          |
| `product`            | Product associated with the campaign                    |
| `no_of_CTA`          | Number of Call-To-Actions (CTAs) in the email           |
| `mean_CTA_len`       | Average length of CTAs                                  |
| `is_image`           | Indicates if the email contains images                  |
| `is_personalised`    | 1 if the email is personalized, 0 otherwise             |
| `is_quote`           | Indicates if the email contains quotes                  |
| `is_timer`           | Indicates if the email contains a timer                 |
| `is_emoticons`       | Indicates if the email contains emoticons               |
| `is_discount`        | 1 if the email offers a discount, 0 otherwise           |
| `is_price`           | Indicates if the email mentions a price                 |
| `is_urgency`         | Indicates if the email conveys urgency                  |
| `target_audience`    | Target audience identifier                              |
| `click_rate`         | Click rate for the email campaign                       |

The target metric analyzed is:

Click Rate – percentage of recipients who clicked a link in the email.

## Business Questions
- The analysis focuses on answering several marketing optimization questions:
- Do emails sent on weekends perform better than weekday campaigns?
- Does personalization increase click-through rates?
- What is the best time of day to send marketing emails?
- Do discount offers increase user engagement?

## Methodology
The analysis uses statistical hypothesis testing to evaluate whether differences in click rates are statistically significant. The following tests were performed:
- Welch Two Sample t-tests for binary variables
- One-way ANOVA for time-of-day comparisons
- Tukey HSD post-hoc testing to identify group differences

All analysis was performed using R and the tidyverse ecosystem.

## Key Findings
1. Weekend vs. Weekday Emails
**Test**: Welch Two Sample t-test
**Result**: t = -4.2272, df = 488.24, p-value = 2.825e-05
**Observation**: Emails sent on weekends have higher click rates than those sent on weekdays.
**Mean Click Rates**: Weekdays = 0.0371, Weekends = 0.0611

2. Personalisation
**Test**: Welch Two Sample t-test
**Result**: t = -1.2945, df = 116.39, p-value = 0.1981
**Observation**: Personalizing emails does not significantly affect click rates.
**Mean Click Rates**: Non-personalized = 0.0412, Personalized = 0.0532

3. Time of Day
**Test**: ANOVA
**Result**: F = 25.41, p-value = 1.3e-11
**Observation**: Time of day significantly affects click rates: Morning > Noon > Evening

Tukey's HSD Test Results
| Comparison         | Difference | p-adjusted |
| ------------------ | ---------- | ---------- |
| Morning vs Evening | 0.0461     | 0.0000     |
| Noon vs Evening    | 0.0219     | 0.0000046  |
| Noon vs Morning    | -0.0242    | 0.0117     |

4. Discounted Emails
**Test**: Welch Two Sample t-test
**Result**: t = 17.819, df = 1844.9, p-value < 2.2e-16
**Observation**: Emails offering discounts have significantly lower click rates than emails without discounts.
**Mean Click Rates**: No Discount = 0.0434, Discount = 0.0062

## Marketing Recommendations
Based on the analysis:
- Schedule marketing emails on weekends when possible
- Prioritize morning send times for higher engagement
- Avoid relying solely on discount messaging
- Test combinations of personalization with other content features

## Repository Contents  
email_campaign_dataset.csv: The dataset used for analysis.  
analysis.R: R script containing the code for data analysis and statistical tests.
