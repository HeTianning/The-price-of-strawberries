# Berry Markets Uncovered: Analyzing Strawberry Pricing Strategies Across Canadian Vendors

## Overview

This repo contains the analysis of strawberry pricing strategies across Canadian grocery vendors using data sourced from the Project Hammer dataset. The study employs a Bayesian linear regression model to examine how vendor identity, original price, seasonal trends, and promotional strategies influence the current price of strawberries. The dataset includes detailed pricing information from major Canadian vendors, offering a comprehensive perspective on market dynamics and pricing variability across regions and time. This approach aims to uncover the key factors driving strawberry prices and provides insights into vendor-specific strategies, seasonal pricing fluctuations, and the role of promotions in shaping consumer behavior.

To use this folder, click the green "Code" button", then "Download ZIP". Move the downloaded folder to where you want to work on your own computer, and then modify it to suit.



## File Structure

The repo is structured as:

-   `data/simulated_data` contains a simulated dataset constructed to mimic real-world strawberry pricing dynamics across major Canadian vendors.
-   `data/raw_data` contains the raw data as obtained from Jacob Filipp.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted model and an API of the model.
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Statement on LLM Usage: Aspects of the code and paper were written with the help of ChatGPT. Some of the data interpretation, introduction, and discussion were also written using ChatGPT. The entire chat history is available in others/llms/usage.txt


## Statement on dataset
The dataset used in this article is from Project Hammer, which provides Canadian grocery prices. I downloaded the zipped CSVs with full price data. There are two CSV files: hammer-4-product.csv and hammer-4-raw.csv. Since hammer-4-raw.csv is too large to upload to GitHub, I only uploaded hammer-4-product.csv. You can get the data (hammer-4-raw.csv) from Project Hammer and put the data into 01-raw_data in data to run everything.