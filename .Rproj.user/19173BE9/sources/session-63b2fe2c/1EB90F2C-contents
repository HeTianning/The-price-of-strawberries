#### Preamble ####
# Purpose: Simulates a dataset of Australian electoral divisions, including the 
  #state and party that won each division.
# Author: Tianning He
# Date: 23 November 2024
# Contact: tianning@utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)

#### Simulating data ####
set.seed(112)

#### Simulate data ####
# Define vendors
vendors <- c("Voila", "T&T", "Loblaws", "No Frills", "Metro", "Galleria", "Walmart", "Save-On-Foods")

# Simulate strawberry price data
strawberry_data <- tibble(
  vendor = sample(vendors, size = 200, replace = TRUE), # 200 observations across 8 vendors
  price_per_lb = round(rnorm(200, mean = 3.5, sd = 0.5), 2), # Prices centered at $3.50 per lb
  organic = sample(
    c("Yes", "No"),
    size = 200,
    replace = TRUE,
    prob = c(0.4, 0.6) # Organic: 40%, Non-organic: 60%
  ),
  sale = sample(
    c("On Sale", "Not on Sale"),
    size = 200,
    replace = TRUE,
    prob = c(0.3, 0.7) # Sales occur 30% of the time
  ),
  date = sample(
    seq(as.Date("2024-02-28"), Sys.Date(), by = "day"), # Dates from Feb 28, 2024, to today
    size = 200,
    replace = TRUE
  )
)

#### Save data ####
write_csv(strawberry_data, "data/00-simulated_data/simulated_strawberry_prices.csv")

#### Inspect data ####
print(head(strawberry_data))