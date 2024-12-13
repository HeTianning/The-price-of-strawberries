#### Preamble ####
# Purpose: setting up the model with analysis data
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
analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

# Set up the regression model for vendor comparison
vendor_price_model <- stan_glm(
  formula = current_price ~ vendor + month + old_price, # Include date as a predictor
  data = analysis_data,
  family = gaussian(), # Continuous outcome 
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE), # Priors for coefficients
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE), # Prior for intercept
  prior_aux = exponential(rate = 1, autoscale = TRUE), # Prior for auxiliary parameters
  seed = 853 # For reproducibility
)


# Save the model
saveRDS(
  vendor_price_model,
  file = "models/vendor_price_model.rds"
)

# Summary of the model
summary(vendor_price_model)