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

#### Define vendors ####
vendors <- c("Voila", "TandT", "Loblaws", "NoFrills", "Metro", "Galleria", "Walmart", "SaveOnFoods")

#### Create a seasonal effect on prices (e.g., higher in summer months, lower in winter) ####
seasonal_effect <- tibble(
  month = 1:12,
  price_multiplier = c(0.9, 0.95, 1.0, 1.1, 1.2, 1.3, 1.3, 1.2, 1.1, 1.0, 0.95, 0.9) # Higher prices in summer
)

#### Create a vendor-based price bias ####
vendor_bias <- tibble(
  vendor = vendors,
  vendor_multiplier = c(1.0, 0.95, 1.2, 0.9, 1.15, 1.0, 0.85, 0.9) # Loblaws (1.2) and Metro (1.15) are more expensive
)

#### Simulate strawberry price data ####
simulated_data <- tibble(
  vendor = sample(vendors, size = 200, replace = TRUE), # 200 observations across 8 vendors
  month = sample(1:12, size = 200, replace = TRUE)
) %>%
  left_join(seasonal_effect, by = "month") %>%
  left_join(vendor_bias, by = "vendor") %>%
  mutate(
    base_price = runif(n(), 2, 6), # Base random price
    current_price = round(base_price * price_multiplier * vendor_multiplier, 2),
    old_price = round(base_price * price_multiplier * vendor_multiplier * runif(n(), 0.8, 1.0), 2)
  ) %>%
  select(vendor, month, current_price, old_price)

#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")

#### Inspect data ####
print(head(simulated_data))
