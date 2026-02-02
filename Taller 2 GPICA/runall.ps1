# ==============================================================================
# runall.ps1
# Run full GPICA pipeline
# ==============================================================================

$ErrorActionPreference = "Stop"

# Go to project root
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir

Write-Host "Starting pipeline..." -ForegroundColor Green

# Check Rscript
$Rscript = Get-Command Rscript -ErrorAction SilentlyContinue
if (-not $Rscript) {
    Write-Host "ERROR: Rscript not found." -ForegroundColor Red
    exit 1
}

Write-Host "Rscript found." -ForegroundColor Green

# Restore renv (ONCE)
Rscript --vanilla -e "
if (!requireNamespace('renv', quietly = TRUE)) {
  install.packages('renv', repos='https://cloud.r-project.org')
}
renv::load()
renv::restore(prompt = FALSE)
"


# Run scripts
Rscript --vanilla codigo/o_renv_initialize.R
Rscript --vanilla codigo/simulate_data.R
Rscript --vanilla codigo/01_limpieza.R
Rscript --vanilla codigo/02_analisis.R
Rscript --vanilla codigo/03_tablas.R
Rscript --vanilla codigo/04_graficos.R

Write-Host "Pipeline completed successfully." -ForegroundColor Green
