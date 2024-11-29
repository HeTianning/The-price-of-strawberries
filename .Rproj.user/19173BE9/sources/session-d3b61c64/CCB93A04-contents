#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Tianning He
# Date: 26 November 2024 
# Contact: tianning.he@utoronto.ca 
# License: MIT
# Pre-requisites: Clean and test the raw Canadian Grocery Price data 
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_parquet("data/analysis_data/analysis_data.parquet")

#### Draw graph ####
library(ggplot2)

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
