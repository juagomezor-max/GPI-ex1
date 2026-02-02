rm(list = ls())

# Load required packages
library(dplyr)# for data manipulation
library(readr)# for reading CSV files
library(stringr)# for string operations
library(lubridate)# for date handling
library(tibble)# for enhanced data frames

# Load the raw data
raw_data <- read_csv("data/raw/raw_data_simulated.csv")
# Initial inspection
glimpse(raw_data)
# Data cleaning steps
cleaned_data <- raw_data %>%
    # Remove rows with invalid dates
    filter(date >= as.Date("2020-01-01")) %>%
    
    # Handle missing values
    mutate(
        value = ifelse(is.na(value), mean(value, na.rm = TRUE), value),
        amount = ifelse(is.na(amount) | amount < 0, median(amount[amount >= 0], na.rm = TRUE), amount),
        cost = ifelse(is.na(cost), mean(cost, na.rm = TRUE), cost),
        profit = ifelse(is.na(profit), mean(profit, na.rm = TRUE), profit)
    ) %>%
    
    # Standardize character columns
    mutate(
        region = str_to_title(str_trim(region)),
        status = str_trim(status)
    ) %>%
    
    # Remove outliers in 'value' column
    filter(value >= quantile(value, 0.05) & value <= quantile(value, 0.95)) %>%
    
    # Ensure quantity is non-negative
    mutate(quantity = ifelse(quantity < 0, abs(quantity), quantity))
# Final inspection
glimpse(cleaned_data)
# Save the cleaned data     
write_csv(cleaned_data, "data/clean/cleaned_data.csv")
