#### Preamble ####
# Purpose: Test the simulated data
# Author: Tianning He
# Date: 25 November 2024
# Contact: tianning.he@utoronto.ca
# License: MIT
# Pre-requisites: Simulate the Canadian Grocery Price Data
# Any other information needed? N/A


#### Workspace setup ####

library(testthat)


# Load the simulated data
simulated_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Test if the data was successfully loaded
test_that("Dataset is successfully loaded", {
  expect_true(exists("simulated_data"), info = "The dataset could not be loaded.")
})

# Test if the dataset has 200 rows
test_that("Dataset has the correct number of rows", {
  expect_equal(nrow(simulated_data), 200, info = "The dataset does not have 200 rows.")
})

# Test if the dataset has 4 columns
test_that("Dataset has the correct number of columns", {
  expect_equal(ncol(simulated_data), 4, info = "The dataset does not have 4 columns.")
})

# Test if the 'vendor' column contains only valid vendor names
test_that("'vendor' column contains only valid values", {
  valid_vendors <- c("Voila", "TandT", "Loblaws", "NoFrills", "Metro", "Galleria", "Walmart", "SaveOnFoods")
  expect_true(all(simulated_data$vendor %in% valid_vendors), 
              info = "The 'vendor' column contains invalid vendor names.")
})

# Test that the 'current_price' and 'old_price' columns are numeric types
test_that("'current_price' and 'old_price' are numeric", {
  expect_type(simulated_data$current_price, "double")
  expect_type(simulated_data$old_price, "double")
})

# Test that the 'month' column contains values from 1 to 12
test_that("'month' column contains valid month values", {
  expect_true(all(simulated_data$month %in% 1:12), 
              info = "The 'month' column contains values outside the range 1 to 12.")
})

# Test to check for missing values in the dataset
test_that("Dataset has no missing values", {
  expect_true(all(!is.na(simulated_data)), 
              info = "The dataset contains missing values.")
})

