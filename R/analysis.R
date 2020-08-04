source("R/packages.R")
source("R/functions.R")

# Load and prepare data ---------------------------------------------------------------

# Soil CN
soil_CN_d <- read.csv("Data/Soil_CN.csv", stringsAsFactors = FALSE)

# Leaf d15N
leaf_d <- read.csv("Data/Leaf_d15N.csv", stringsAsFactors = FALSE)

# Pyrolysis
pyr_L_raw_d <- read.csv("Data/Pyrolysis_chromatogram_Lhoriz.csv", stringsAsFactors = FALSE) %>% 
  left_join(soil_CN_d) %>% 
  left_join(leaf_d)
pyr_FH_raw_d <- read.csv("Data/Pyrolysis_chromatogram_FHhoriz.csv", stringsAsFactors = FALSE) %>% 
  left_join(soil_CN_d) %>% 
  left_join(leaf_d)

# NMR
nmr_raw_d <- read.csv("Data/NMR_spectra_relative_abund.csv", stringsAsFactors = FALSE) %>% 
  left_join(soil_CN_d) %>% 
  left_join(leaf_d)


# Analysis ----------------------------------------------------------------

# . Leaf d15N vs. distance from the edge of the plot ----------------------------
source("R/analysis_leaf_d15N.R")


# . Pyrolysis ---------------------------------------------------------------
source("R/analysis_pyrolysis.R")

# . NMR ---------------------------------------------------------------------
source("R/analysis_NMR.R")

# . lignin:carbohydrate ratios vs. leaf d15N --------------------------------
source("R/analysis_LCratio.R")

# . Correlation test ----------------------------------------
source("R/analysis_correlation.R")
