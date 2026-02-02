# 0_renv_initialize.R
rm(list = ls())

if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv", repos = "https://cloud.r-project.org")
}

if (!file.exists("renv.lock")) {
  # Create a minimal renv project without prompts
  renv::init(bare = TRUE)
  message("renv initialized (bare). You should add dependencies and snapshot.")
} else {
  renv::load()
  renv::restore(prompt = FALSE)
  message("renv environment restored from renv.lock.")
}
