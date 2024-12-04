#### Preamble ####
# Purpose: Explore and understand data by creating data visualizations
# Author: Tianning He
# Date: 26 November 2024 
# Contact: tianning.he@utoronto.ca 
# License: MIT
# Pre-requisites: Clean and test the raw Canadian Grocery Price data 
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(ggplot2)
#### Read data ####
analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

#### Draw graph ####

ggplot(analysis_data, aes(x = current_price)) +
  geom_histogram(binwidth = 0.5, fill = "skyblue", color = "black") +
  labs(
    title = "Distribution of Current Prices",
    x = "Current Price (CAD)",
    y = "Frequency"
  ) +
  theme_minimal()

ggplot(analysis_data, aes(x = vendor, y = current_price, fill = vendor)) +
  stat_summary(fun = "mean", geom = "bar", color = "black") +
  labs(
    title = "Average Current Price by Vendor",
    x = "Vendor",
    y = "Average Current Price (CAD)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

analysis_data_long <- analysis_data %>%
  pivot_longer(cols = c(current_price, old_price), 
               names_to = "price_type", 
               values_to = "price")

ggplot(analysis_data_long, aes(x = price_type, y = price, fill = price_type)) +
  geom_boxplot() +
  facet_wrap(~ vendor) +
  labs(
    title = "Comparison of Current and Old Prices by Vendor",
    x = "Price Type",
    y = "Price (CAD)"
  ) +
  theme_minimal()

ggplot(analysis_data, aes(x = month, y = current_price, group = vendor, color = vendor)) +
  stat_summary(fun = "mean", geom = "line", size = 1) +
  geom_point(stat = "summary", fun = "mean", size = 2) +
  labs(
    title = "Monthly Trend of Current Prices by Vendor",
    x = "Month",
    y = "Average Current Price (CAD)"
  ) +
  theme_minimal()

analysis_data <- analysis_data %>%
  mutate(price_difference = old_price - current_price)

ggplot(analysis_data, aes(x = price_difference)) +
  geom_histogram(binwidth = 0.5, fill = "orange", color = "black") +
  labs(
    title = "Distribution of Price Differences (Old - Current)",
    x = "Price Difference (CAD)",
    y = "Frequency"
  ) +
  theme_minimal()