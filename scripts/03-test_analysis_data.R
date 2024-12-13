#### Preamble ####
# Purpose: Test the cleaned Canadian Grocery Price data 
# Author: Tianning He
# Date: 26 November 2024 
# Contact: tianning.he@utoronto.ca 
# License: MIT
# Pre-requisites: Clean the raw Canadian Grocery Price data
# Any other information needed? N/A


#### Workspace setup ####
library(testthat)
library(arrow)

# Load the simulated data
analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

# Test if the data was successfully loaded
test_that("Dataset is successfully loaded", {
  expect_true(exists("analysis_data"), info = "The dataset could not be loaded.")
})

# Test if the dataset has 44854 rows
test_that("Dataset has the correct number of rows", {
  expect_equal(nrow(analysis_data), 44854, info = "The dataset does not have 44854 rows.")
})

# Test if the dataset has 4 columns
test_that("Dataset has the correct number of columns", {
  expect_equal(ncol(analysis_data), 4, info = "The dataset does not have 4 columns.")
})

# Test if the 'vendor' column contains only valid vendor names
test_that("'vendor' column contains only valid values", {
  valid_vendors <- c("Voila", "TandT", "Loblaws", "NoFrills", "Metro", "Galleria", "Walmart", "SaveOnFoods")
  expect_true(all(analysis_data$vendor %in% valid_vendors), 
              info = "The 'vendor' column contains invalid vendor names.")
})

# Test that the 'current_price' and 'old_price' columns are numeric types
test_that("'current_price' and 'old_price' are numeric", {
  expect_type(analysis_data$current_price, "double")
  expect_type(analysis_data$old_price, "double")
})

# Test that the 'month' column contains values from 1 to 12
test_that("'month' column contains valid month values", {
  expect_true(all(analysis_data$month %in% 1:12), 
              info = "The 'month' column contains values outside the range 1 to 12.")
})

# Test to check for missing values in the dataset
test_that("Dataset has no missing values", {
  expect_true(all(!is.na(analysis_data)), 
              info = "The dataset contains missing values.")
})

