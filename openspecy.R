# Load Packages
library(dplyr)
library(OpenSpecy)

# Fetch current spectral library from https://osf.io/x7dpz/
get_lib()

# Load library into global environment
spec_lib <- load_lib()

# Read sample spectrum
raman_hdpe <- read_text(read_extdata("reference_absorbance_raw.csv"))
