library(plumber)
library(rstanarm)
library(tidyverse)

# Load the model
model <- readRDS("vendor_price_model.rds")

# Define the model version
version_number <- "0.0.1"

# Define the variables
variables <- list(
  old_price = "The previous price of the product, numeric value.",
  vendor = "The vendor, categorical: 'Galleria', 'Loblaws', 'Metro', 'NoFrills', 'SaveOnFoods', 'TandT', 'Voila', 'Walmart'",
  month = "The month of the year, numeric (1 to 12)."
)

#* @param old_price The previous price of the product, numeric value.
#* @param vendor The vendor, categorical: 'Galleria', 'Loblaws', 'Metro', 'NoFrills', 'SaveOnFoods', 'TandT', 'Voila', 'Walmart'
#* @param month The month of the year, numeric (1 to 12)
#* @get /predict_price
predict_price <- function(old_price = 4, vendor = "Metro", month = 11) {
  # Convert inputs to appropriate types
  old_price <- as.numeric(old_price)
  vendor <- as.character(vendor)
  month <- as.integer(month)
  
  # Prepare the payload as a data frame
  payload <- data.frame(
    old_price = old_price,
    vendor = vendor,
    month = month
  )
  
  # Extract posterior samples
  posterior_samples <- as.matrix(model)  # Convert to matrix for easier manipulation
  
  # Define the generative process for prediction
  beta_old_price <- posterior_samples[, "old_price"]
  beta_loblaws <- posterior_samples[, "vendorLoblaws"]
  beta_metro <- posterior_samples[, "vendorMetro"]
  beta_nofrills <- posterior_samples[, "vendorNoFrills"]
  beta_saveon <- posterior_samples[, "vendorSaveOnFoods"]
  beta_TnT <- posterior_samples[, "vendorTandT"]
  beta_viola <- posterior_samples[, "vendorVoila"]
  beta_walmart <- posterior_samples[, "vendorWalmart"]
  beta_month <- posterior_samples[, "month"]
  alpha <- posterior_samples[, "(Intercept)"]
  
  # Compute the predicted value for the observation with updated vendor logic
  predicted_values <- alpha +
    beta_old_price * payload$old_price +
    ifelse(payload$vendor == "Loblaws", beta_loblaws, 0) +
    ifelse(payload$vendor == "Metro", beta_metro, 0) +
    ifelse(payload$vendor == "NoFrills", beta_nofrills, 0) +
    ifelse(payload$vendor == "SaveOnFoods", beta_saveon, 0) +
    ifelse(payload$vendor == "TandT", beta_TnT, 0) +
    ifelse(payload$vendor == "Voila", beta_viola, 0) +
    ifelse(payload$vendor == "Walmart", beta_walmart, 0) +
    beta_month * payload$month
  
  
  # Predict
  mean_prediction <- mean(predicted_values)
  
  # Store results
  result <- list(
    "predicted price" = round(mean_prediction,2)
  )
  
  return(result)
}
