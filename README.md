# Email Campaign Data Analysis

## Introduction
This project analyzes the effectiveness of various factors on email campaign click rates using a dataset of email campaigns. The dataset includes information on whether the email contained discounts, personalization, images, and other features, as well as the time of day and day of the week the email was sent.

## Dataset
The dataset, named email_campaign_dataset.csv, includes the following columns:

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

## Data Analysis
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

## Repository Contents  
email_campaign_dataset.csv: The dataset used for analysis.  
analysis.R: R script containing the code for data analysis and statistical tests.

## Conclusion
This analysis identifies key factors that influence email campaign click rates. Key insights include:
- Emails sent on weekends receive higher engagement than weekday emails.
- Personalization does not significantly impact click rates.
- Time of day is important, with morning emails performing best.
- Surprisingly, emails offering discounts have lower click rates than non-discount emails.
- These findings can inform strategies for crafting email campaigns to maximize engagement and conversion.
