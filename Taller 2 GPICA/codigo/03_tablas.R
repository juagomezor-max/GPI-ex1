# ==============================================================================
# SCRIPT: Generate HTML Tables
# ==============================================================================

# 1. CLEAN THE ENVIRONMENT
rm(list = ls())

# 2. LOAD REQUIRED PACKAGES
library(dplyr)      # for data manipulation
library(readr)      # for reading CSV files
library(knitr)      # for kable function
library(kableExtra) # for enhanced table formatting
library(tibble)     # for enhanced data frames

# 3. LOAD ANALYSIS RESULTS
analysis_results <- read_csv("resultados/analysis_results.csv")

# 4. CREATE BEAUTIFUL HTML TABLE

# 4.1 Format numbers for better presentation
table_formatted <- analysis_results %>%
    mutate(
        total_value = format(round(total_value, 2), big.mark = ",", nsmall = 2),
        average_amount = format(round(average_amount, 2), big.mark = ",", nsmall = 2),
        median_amount = format(round(median_amount, 2), big.mark = ",", nsmall = 2),
        sd_amount = format(round(sd_amount, 2), big.mark = ",", nsmall = 2),
        min_amount = format(round(min_amount, 2), big.mark = ",", nsmall = 2),
        max_amount = format(round(max_amount, 2), big.mark = ",", nsmall = 2),
        max_profit = format(round(max_profit, 2), big.mark = ",", nsmall = 2)
    )

# 4.2 Create HTML table with enhanced styling
html_table <- kable(table_formatted, 
                    format = "html",
                    caption = "Analysis Results by Region and Status",
                    escape = FALSE) %>%
    kable_styling(
        bootstrap_options = c("striped", "hover", "condensed", "responsive"),
        full_width = TRUE,
        position = "center",
        font_size = 11
    ) %>%
    column_spec(1, bold = TRUE, color = "white", background = "#2c3e50") %>%
    column_spec(2, bold = TRUE, color = "white", background = "#34495e") %>%
    row_spec(0, bold = TRUE, color = "white", background = "#16a085") %>%
    add_header_above(c(" " = 2, "Metrics" = 8)) %>%
    footnote(general = "Data processed and analyzed on 2026-02-01",
             general_title = "Note:")

# 4.3 Save HTML table
write(as.character(html_table), file = "resultados/analysis_table.html")

# 4.4 Display table
print(html_table)

cat("\n✓ HTML table saved to: resultados/analysis_table.html\n")
