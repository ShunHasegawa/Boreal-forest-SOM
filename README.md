Decadal nitrogen addition alters chemical composition of soil organic
matter in a boreal forest
================
Shun Hasegawa
4th August 2020

This repository stores the R scripts and data to reproduced the results
presented in XXX.

# File description

## R scripts

  - **analysis.R**: This loads required packages and data.   

  - **analysis\_correlation.R**: This analyses correlation between leaf
    ^{15}N and the relative abundance of N compound in the pyrolysis
    products, soil C:N ratio and the relative abundance of N compound in
    the pyrolysis products and leaf $\delta^{15}N$ and soil C mass.

  - **analysis\_LCratio.R**: This analyses the association between
    lignin:carbohydrate ratios in the pyrolysis product and leaf
    \(\delta^{15}N\).

  - **analysis\_leaf\_d15N.R**: This fits an asymptotic regression line
    on leaf \(\delta^{15}N\) as a function of distance from the edge of
    the experimental plots.

  - **analysis\_NMR.R**: Herein, the results of NMR analysis were
    summarised. Also, redundancy analysis (RDA) is performed on the
    composition of NMR products to assess its association with leaf
    \(\delta^{15}N\).

  - **analysis\_pyrolysis.R**: Herein, the results of pyrolysis GC/MS
    were summarised. Also, RDA is performed on the composition of
    pyroslysis products to assess its association with leaf
    \(\delta^{15}N\).

## Data

  - **Leaf\_d15N.csv**: Data on \(\delta^{15}N\) in *Vaccinium
    vitis-idaea* leaves.

  - **NMR\_spectra\_relative\_abund.csv**: Relative abundance of NMR
    products.

  - **Pyrolysis\_chromatogram\_FHhoriz.csv**: Peak area size of
    chromatogram for the pyrolysis products in the soil samples
    collected at the F/H horizon.

  - **Pyrolysis\_chromatogram\_Lhoriz.csv**: Peak area size of
    chromatogram for the pyrolysis products in the soil samples
    collected at the L horizon.

  - **Soil\_CN.csv**: C and N mass in the soil.

## Session information

    ## R version 3.5.2 (2018-12-20)
    ## Platform: x86_64-apple-darwin15.6.0 (64-bit)
    ## Running under: macOS  10.15.6
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
    ##  [1] car_3.0-8       carData_3.0-1   lmerTest_3.0-1  lme4_1.1-21    
    ##  [5] Matrix_1.2-18   vegan_2.5-2     lattice_0.20-38 permute_0.9-4  
    ##  [9] ggplot2_3.0.0   tidyr_0.8.1     dplyr_0.7.6     plyr_1.8.4     
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] tidyselect_0.2.4  xfun_0.16         purrr_0.2.5       splines_3.5.2    
    ##  [5] haven_1.1.2       colorspace_1.3-2  htmltools_0.3.6   yaml_2.1.19      
    ##  [9] mgcv_1.8-26       rlang_0.2.1       pillar_1.2.3      nloptr_1.0.4     
    ## [13] foreign_0.8-71    glue_1.4.1        withr_2.1.2       readxl_1.1.0     
    ## [17] bindrcpp_0.2.2    bindr_0.1.1       stringr_1.3.1     cellranger_1.1.0 
    ## [21] munsell_0.5.0     gtable_0.2.0      zip_2.0.1         evaluate_0.14    
    ## [25] knitr_1.29        rio_0.5.10        forcats_0.3.0     parallel_3.5.2   
    ## [29] curl_3.2          Rcpp_0.12.17      scales_0.5.0      abind_1.4-5      
    ## [33] hms_0.4.2         digest_0.6.15     openxlsx_4.1.0    stringi_1.2.3    
    ## [37] numDeriv_2016.8-1 grid_3.5.2        tools_3.5.2       magrittr_1.5     
    ## [41] lazyeval_0.2.1    tibble_1.4.2      cluster_2.0.7-1   pkgconfig_2.0.1  
    ## [45] MASS_7.3-51.5     data.table_1.11.4 assertthat_0.2.0  minqa_1.2.4      
    ## [49] rmarkdown_2.3     R6_2.2.2          boot_1.3-20       nlme_3.1-137     
    ## [53] compiler_3.5.2
