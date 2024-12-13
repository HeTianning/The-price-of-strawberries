#### Preamble ####
# Purpose: Cleans the raw Canadian grocery price data
# Author: Tianning He
# Date: 26 November 2024 
# Contact: tianning.he@utoronto.ca 
# License: MIT
# Pre-requisites: Download and save the Canadian grocery price Data from Jacob Filipp
# Any other information needed? As the downloaded raw data is saved into files, 
# need to clean each file and then merge them together

#### Workspace setup ####
library(tidyverse)
library(janitor)

# Load raw data
raw_data <- read_csv("data/01-raw_data/hammer-4-raw.csv")
product_data <- read_csv("data/01-raw_data/hammer-4-product.csv")

# Join raw data with product data
merged_data <- raw_data %>%
  left_join(product_data, by = c("product_id" = "id")) %>%
  filter(!is.na(product_id)) %>%
  rename(timestamp = nowtime)

# Select and clean relevant columns
filtered_data <- merged_data %>%
  filter(str_detect(tolower(product_name), "strawberr")) %>%
  mutate(
    current_price = as.numeric(str_replace_all(current_price, "[^0-9.]", "")),
    old_price = as.numeric(str_replace_all(old_price, "[^0-9.]", "")),
    month = lubridate::month(timestamp)
  ) %>%
  select(vendor, current_price, old_price, month) %>%
  drop_na()

#### Save data ####
write_parquet(filtered_data, "data/02-analysis_data/analysis_data.parquet")

#### Inspect cleaned data ####
print(head(filtered_data))

