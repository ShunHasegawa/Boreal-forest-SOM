Decadal nitrogen addition alters chemical composition of soil organic
matter in a boreal forest—accepted by Geoderma
================
Shun Hasegawa
5th January 2021

This repository stores the R scripts and raw data to reproduce the
results presented in the manuscript below.

  - Article title: Decadal nitrogen addition alters chemical composition
    of soil organic matter in a boreal forest
  - Authors: Shun Hasegawa; John Marshall; Tobias Sparrman; Torgny
    Näsholm
  - Journal: **Geoderma**
  - Article acceptance date: 19<sup>th</sup> December 2020

# File description

## R scripts

  - **analysis.R**: This loads required packages and data.

  - **analysis\_correlation.R**: This analyses correlation between leaf
    d15N and the relative abundance of N compound in the pyrolysis
    products, soil C:N ratio and the relative abundance of N compound in
    the pyrolysis products and leaf d15N and soil C mass.

  - **analysis\_GSratio.R**: This analyses the association between
    guaiacyl to syringyl lignin ratios in the pyrolysis product and leaf
    d15N.

  - **analysis\_LCratio.R**: This analyses the association between
    lignin:carbohydrate ratios in the pyrolysis product and leaf d15N.

  - **analysis\_leaf\_d15N.R**: This fits an asymptotic regression line
    on leaf d15N as a function of distance from the edge of the
    experimental plots.

  - **analysis\_NMR.R**: Herein, the results of NMR analysis were
    summarised. Also, redundancy analysis (RDA) is performed on the
    composition of NMR products to assess its association with leaf
    d15N.

  - **analysis\_NMR\_Cmass.R**: Herein, C mass of lignin and
    carbohydrate compouds were estimated using the molecular mixing
    model from the NMR-product data. Then, how changes in the estimated
    C mass with leaf d15N vary between lignin and carbohydrates was
    anlysed.

  - **analysis\_pyrolysis.R**: Herein, the results of pyrolysis GC/MS
    were summarised. Also, RDA is performed on the composition of
    pyrolysis products to assess its association with leaf d15N.

## Data

  - **Leaf\_d15N.csv**: Data on d15N in *Vaccinium vitis-idaea* leaves.

  - **NMR\_spectra\_relative\_abund.csv**: Relative abundance of NMR
    products.

  - **Pyrolysis\_chromatogram\_FHhoriz.csv**: Peak area size of
    chromatogram for the pyrolysis products in the soil samples
    collected in the F/H horizon.

  - **Pyrolysis\_chromatogram\_Lhoriz.csv**: Peak area size of
    chromatogram for the pyrolysis products in the soil samples
    collected in the L horizon.

  - **Soil\_CN.csv**: C and N mass in the soil.

  - **Metadata.csv**: Metadata for the above data files.

## Session information

    ## R version 3.5.2 (2018-12-20)
    ## Platform: x86_64-apple-darwin15.6.0 (64-bit)
    ## Running under: macOS  10.15.7
    ## 
    ## Matrix products: default
    ## BLAS: /Library/Frameworks/R.framework/Versions/3.5/Resources/lib/libRblas.0.dylib
    ## LAPACK: /Library/Frameworks/R.framework/Versions/3.5/Resources/lib/libRlapack.dylib
    ## 
    ## locale:
    ## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ##  [1] emmeans_1.4.8   car_3.0-8       carData_3.0-1   lmerTest_3.0-1 
    ##  [5] lme4_1.1-21     Matrix_1.2-18   vegan_2.5-2     lattice_0.20-38
    ##  [9] permute_0.9-4   ggplot2_3.0.0   tidyr_0.8.1     dplyr_0.7.6    
    ## [13] plyr_1.8.4     
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] Rcpp_0.12.17      mvtnorm_1.0-8     zoo_1.8-3         assertthat_0.2.0 
    ##  [5] digest_0.6.15     R6_2.2.2          cellranger_1.1.0  evaluate_0.14    
    ##  [9] coda_0.19-2       pillar_1.2.3      rlang_0.2.1       lazyeval_0.2.1   
    ## [13] curl_3.2          multcomp_1.4-8    readxl_1.1.0      minqa_1.2.4      
    ## [17] data.table_1.11.4 nloptr_1.0.4      rmarkdown_2.3     splines_3.5.2    
    ## [21] stringr_1.3.1     foreign_0.8-71    munsell_0.5.0     compiler_3.5.2   
    ## [25] numDeriv_2016.8-1 xfun_0.16         pkgconfig_2.0.1   mgcv_1.8-26      
    ## [29] htmltools_0.3.6   tidyselect_0.2.4  tibble_1.4.2      codetools_0.2-15 
    ## [33] rio_0.5.10        withr_2.1.2       MASS_7.3-51.5     grid_3.5.2       
    ## [37] nlme_3.1-137      xtable_1.8-2      gtable_0.2.0      magrittr_1.5     
    ## [41] scales_0.5.0      zip_2.0.1         estimability_1.3  stringi_1.2.3    
    ## [45] bindrcpp_0.2.2    boot_1.3-20       sandwich_2.4-0    openxlsx_4.1.0   
    ## [49] TH.data_1.0-9     tools_3.5.2       forcats_0.3.0     glue_1.4.1       
    ## [53] purrr_0.2.5       hms_0.4.2         survival_2.43-3   abind_1.4-5      
    ## [57] parallel_3.5.2    yaml_2.1.19       colorspace_1.3-2  cluster_2.0.7-1  
    ## [61] knitr_1.29        bindr_0.1.1       haven_1.1.2
