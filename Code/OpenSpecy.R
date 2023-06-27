# SAMPLE CODE (raman_hdpe.csv)
if (FALSE) {
  library(dplyr)
  
  # Fetch current spectral library from https://osf.io/x7dpz/
  get_lib()
  
  # Load library into global environment
  spec_lib <- load_lib()
  
  # Read sample spectrum# SAMPLE CODE (raman_hdpe.csv)
if (FALSE) {
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
}
 
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
}
 
# TEST CODE(ftir_pva_without_header.csv)
## Load Packages
library(dplyr)
library(OpenSpecy)

## Fetch current spectral library from https://osf.io/x7dpz/
get_lib()

## Load library into global environment
spec_lib <- load_lib()

## Read sample spectrum (Correct for missing header)
ftir_pva <- read_text(read_extdata("ftir_pva_without_header.csv"), header = FALSE)

## Adjust spectral intensity
ftir_pva_adj <- ftir_pva %>%
  adj_intens()

## Smooth Spectrum 
ftir_pva_smooth <- ftir_pva_adj %>% 
  smooth_intens() 
  
## Background-correct Spectrum  
  ftir_pva_bgc <- ftir_pva_smooth %>% 
  subtr_bg()

# Match spectrum with library and retrieve meta data
match_spec(ftir_pva_bgc, library = spec_lib, which = "ftir")

find_spec(sample_name == 598, library = spec_lib, which = "ftir")