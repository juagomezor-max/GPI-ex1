# ==============================================================================
# SCRIPT: Exploratory Data Analysis
# ==============================================================================

# 1. CLEAN THE ENVIRONMENT
rm(list = ls())

# 2. LOAD REQUIRED PACKAGES
library(dplyr)      # for data manipulation
library(readr)      # for reading CSV files
library(stringr)    # for string operations
library(lubridate)  # for date handling
library(tibble)     # for enhanced data frames

# 3. LOAD CLEANED DATABASE
cleaned_data <- read_csv("data/clean/cleaned_data.csv")

# 4. GENERATE DESCRIPTIVE STATISTICS

# 4.1 Dataset dimensions
cat("\n=== DATASET DIMENSIONS ===\n")
cat("Number of rows:", nrow(cleaned_data), "\n")
cat("Number of columns:", ncol(cleaned_data), "\n")
cat("Column names:", paste(names(cleaned_data), collapse = ", "), "\n")

# 4.2 Data types
cat("\n=== DATA TYPES ===\n")
print(str(cleaned_data))

# 4.3 Descriptive statistics by numeric variable
cat("\n=== DESCRIPTIVE STATISTICS - NUMERIC VARIABLES ===\n")
summary(cleaned_data)

# 4.4 Analysis by groups (region and status)
cat("\n=== ANALYSIS GROUPED BY REGION AND STATUS ===\n")
analysis_results <- cleaned_data %>%
    group_by(region, status) %>%
    summarise(
        count = n(),
        total_value = sum(value, na.rm = TRUE),
        average_amount = mean(amount, na.rm = TRUE),
        median_amount = median(amount, na.rm = TRUE),
        sd_amount = sd(amount, na.rm = TRUE),
        min_amount = min(amount, na.rm = TRUE),
        max_amount = max(amount, na.rm = TRUE),
        max_profit = max(profit, na.rm = TRUE),
        .groups = 'drop'
    ) %>%
    arrange(desc(total_value))

print(analysis_results)

# 4.5 Save results
write_csv(analysis_results, "resultados/analysis_results.csv")
cat("\n✓ Results saved to: resultados/analysis_results.csv\n")
