# config.R
# Portable path configuration for RADIOHEAD medication analysis
#
# Usage: Source this file at the top of each script with:
#   source(here::here("R", "config.R"))

library(here)

# Automatically detect project root using {here}
project_root <- here::here()

# Define all directory paths relative to project root
paths <- list(
  # Main directories
  root = project_root,
  data = here::here("data"),
  data_raw = here::here("data", "raw"),
  data_processed = here::here("data", "processed"),
  scripts = here::here("scripts"),
  R = here::here("R"),
  output = here::here("output"),
  figures = here::here("output", "figures"),
  tables = here::here("output", "tables"),

  # Specific data files
  multivariate_df = here::here("data", "processed", "RADIOHEAD_multivariate_df.csv"),
  systemic_drugs = here::here("data", "processed", "RADIOHEAD_systemicdrugs.csv"),
  polypharmacy_df = here::here("data", "processed", "RADIOHEAD_polypharmacy_df.csv"),
  demographic_df = here::here("data", "processed", "RADIOHEAD_demographic_df.csv"),
  individual_drugs_df = here::here("data", "processed", "individual_drugs_df.csv"),
  palliative_bundle_df = here::here("data", "processed", "palliativebundledf.csv"),
  subclasses_df = here::here("data", "processed", "RADIOHEAD_subclasses.csv"),
  df_clean = here::here("data", "raw", "df.clean15.postMS_2024-08-22.csv"),
  cardiac = here::here("data", "raw", "Cardiac Conditions Detail.xlsx"),
  cards = here::here("data", "raw", "cleaned.cardiac.conditions.xlsx")
)

# Create directories if they don't exist
create_directories <- function() {
  dirs_to_create <- c(
    paths$data,
    paths$data_raw,
    paths$data_processed,
    paths$output,
    paths$figures,
    paths$tables
  )

  for (dir in dirs_to_create) {
    if (!dir.exists(dir)) {
      dir.create(dir, recursive = TRUE)
      message("Created directory: ", dir)
    }
  }
}

# Run on load
create_directories()

# Print confirmation
message("✓ Config loaded. Project root: ", project_root)
message("✓ All paths configured relative to project root")

# Export paths to global environment (optional, for convenience)
list2env(paths, envir = .GlobalEnv)
