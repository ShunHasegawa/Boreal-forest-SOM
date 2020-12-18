GSratio_d <- bind_rows(pyr_L, pyr_FH) %>% 
  mutate(GSratio = `G-lignin`/`S-lignin`) %>% # G-:S-lignin ratio
  left_join(soil_CN_d) 

gs_leafd15N_m1 <- lmer(log(GSratio) ~ leaf_d15N * horizon + (1|id), GSratio_d)
Anova(gs_leafd15N_m1, test.statistic = "F")
plot(gs_leafd15N_m1)
qqPlot(resid(gs_leafd15N_m1))
