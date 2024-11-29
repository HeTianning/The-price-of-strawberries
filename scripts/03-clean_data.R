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

#### Read data ####
raw_data <- read_csv("data/01-raw_data/raw_data.csv") # Read in the raw data

#### Clean data ####
# Clean column names and assign to a new variable
raw_data_cleaned <- raw_data |> janitor::clean_names()

# Inspect column names
print(colnames(raw_data_cleaned))

# Proceed with data cleaning using the correct column names
#cleaned_data <-
  raw_data_cleaned |>
    head()

#### Save data ####
write_csv(cleaned_data, "data/02-analysis_data/analysis_data.csv")

#### Inspect cleaned data ####
print(head(cleaned_data))

