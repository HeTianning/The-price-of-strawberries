#### Preamble ####
# Purpose: Simulates a dataset of Canadian grocery price
# Author: Tianning He
# Date: 23 November 2024
# Contact: tianning@utoronto.ca
# License: MIT
# Pre-requisites: Think about the price of Canadian grocery stores and what the price range is
# Any other information needed?  N/A


#### Workspace setup ####
library(tidyverse)

#### Simulating data ####
set.seed(112)

#### Simulate data ####
# Define vendors
vendors <- c("Voila", "TandT", "Loblaws", "NoFrills", "Metro", "Galleria", "Walmart", "SaveOnFoods")

# Simulate strawberry price data
simulated_data <- tibble(
  vendor = sample(vendors, size = 200, replace = TRUE), # 200 observations across 8 vendors
  month = sample(1:12, size = 200, replace = TRUE),
  current_price = round(runif(200,2,6),2),
  old_price = round(runif(200,2,6),2)
)

#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")

#### Inspect data ####
print(head(simulated_data))