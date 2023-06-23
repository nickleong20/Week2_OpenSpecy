# Load Packages
library(dplyr)

# Fetch current spectral library from https://osf.io/x7dpz/
get_lib()

# Load library into global environment
spec_lib <- load_lib()

# Read sample spectrum
raman_hdpe <- read_text(read_extdata("raman_hdpe.csv"))

# Share your spectrum with the Open Spey community
share_spec(raman_hdpe,
           metadata = c(user_name = "Win Cowger",
                        contact_info = "wincowger@gmail.com",
                        spectrum_type = "Raman",
                        spectrum_identity = "HDPE")
)

# Adjust spectral intensity
raman_adj <- raman_hdpe %>%
  adj_intens()

# Smooth and background-correct spectrum
raman_proc <- raman_adj %>% 
  smooth_intens() %>% 
  subtr_bg()

# Match spectrum with library and retrieve meta data
match_spec(raman_proc, library = spec_lib, which = "raman")

find_spec(sample_name == 5381, library = spec_lib, which = "raman")