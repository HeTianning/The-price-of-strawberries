#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Tianning He
# Date: 23 November 2024
# Contact: tianning.he@utoronto.ca 
# License: MIT
# Pre-requisites: None
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)
library(dplyr)


#### Reading in the downloaded data ####

raw_data <- read.csv("data/01-raw_data/hammer-4-product.csv")

#### Saving the data####

write.csv(raw_data, file = "data/01-raw_data/raw_data.csv")



         
