# Clear workspace
rm(list = ls())

# Set seed for reproducibility (I used my student ID)
set.seed(202315618)

# Load required packages (assumes renv has restored them)
library(tibble)   # for tibble()
library(dplyr)    # for data manipulation

# Function to simulate data with realistic distributions
raw_data_simulation <- function(n = 4410) {
  
  # 1. Generate base variables
  id <- 1:n
  
  # 2. Date distribution (more realistic - concentrated in certain periods)
  date <- sample(
    seq(as.Date('2023-01-01'), as.Date('2023-12-31'), by = "day"),
    n,
    replace = TRUE
  )
  
  # 3. Region distribution (realistic probability)
  region <- sample(
    c("Norte", "Centro", "Sur", "Este", "Oeste"),
    n,
    replace = TRUE,
    prob = c(0.25, 0.30, 0.20, 0.15, 0.10)
  )
  
  # 4. Category distribution
  category <- sample(
    c("A", "B", "C", "D"),
    n,
    replace = TRUE,
    prob = c(0.40, 0.30, 0.20, 0.10)
  )
  
  # 5. Status distribution (realistic)
  status <- sample(
    c("Activo", "Inactivo", "Pendiente"),
    n,
    replace = TRUE,
    prob = c(0.60, 0.25, 0.15)
  )
  
  # 6. Quantity: follows a log-normal distribution (common in business)
  quantity <- rlnorm(n, meanlog = 3.5, sdlog = 0.8)
  quantity <- round(pmax(quantity, 1))  # ensure positive integers
  
  # 7. Cost: depends on quantity (realistic correlation)
  cost <- 20 + 0.5 * quantity + rnorm(n, mean = 0, sd = 10)
  cost <- pmax(cost, 5)  # ensure minimum cost
  
  # 8. Amount: depends on quantity and cost (more realistic)
  amount <- cost * quantity + rnorm(n, mean = 0, sd = 50)
  amount <- pmax(amount, 50)  # ensure minimum amount
  
  # 9. Value: influenced by region and status
  value_base <- ifelse(region == "Centro", 80, 
                       ifelse(region == "Norte", 70,
                              ifelse(region == "Sur", 60, 50)))
  
  value_base <- value_base + 
    ifelse(status == "Activo", 20,
           ifelse(status == "Pendiente", 10, 0))
  
  value <- value_base + rnorm(n, mean = 0, sd = 8)
  value <- pmax(value, 10)  # ensure positive values
  
  # 10. Profit: function of amount and cost with some randomness
  profit <- (amount - cost) * 0.15 + rnorm(n, mean = 5, sd = 3)
  
  # Create tibble
  data <- tibble(
    id = id,
    date = date,
    category = category,
    region = region,
    status = status,
    value = round(value, 2),
    amount = round(amount, 2),
    quantity = quantity,
    cost = round(cost, 2),
    profit = round(profit, 2)
  )
  
  # Add realistic missing values (MCAR - Missing Completely at Random)
  na_prob <- 0.02  # 2% missing data
  for (col in c("value", "amount", "cost", "profit")) {
    missing_idx <- sample(1:n, size = round(n * na_prob), replace = FALSE)
    data[[col]][missing_idx] <- NA
  }
  
  # Add small percentage of outliers (realistic)
  outlier_idx <- sample(1:n, size = round(n * 0.02), replace = FALSE)
  data$profit[outlier_idx] <- data$profit[outlier_idx] * 3
  
  return(data)
}

# Simulate the raw data (4410 registros para análisis realista)
raw_data <- raw_data_simulation(4410)

# Save the simulated data to a CSV file
write.csv(
    raw_data,
    file = "data/raw/raw_data_simulated.csv",
    row.names = FALSE
)

# Final message
message(
    "Simulación completada: ",
    nrow(raw_data),
    " registros guardados en 'data/raw/raw_data_simulated.csv'."
)
