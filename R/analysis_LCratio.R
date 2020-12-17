LCratio_d <- bind_rows(pyr_L, pyr_FH) %>% 
  mutate(LCratio = (`G-lignin` + `S-lignin` + Phenol)/Carbohydrate) %>% # lignin:carbohydrate
  left_join(soil_CN_d) 


lc_leafd15N_m1 <- lmer(log(LCratio) ~ leaf_d15N * horizon + (1|id), LCratio_d)
Anova(lc_leafd15N_m1, test.statistic = "F")
plot(lc_leafd15N_m1)
qqPlot(resid(lc_leafd15N_m1))

# Outliers are suggested. So remove them.
lc_leafd15N_m2 <- update(lc_leafd15N_m1, subset=-c(11, 39))
Anova(lc_leafd15N_m2, test.statistic = "F")
plot(lc_leafd15N_m2)
qqPlot(resid(lc_leafd15N_m2))
# interactions were due to the Outliers

# try transformation
lc_leafd15N_m3 <- lmer(1/LCratio ~ leaf_d15N * horizon + (1|id), LCratio_d)
Anova(lc_leafd15N_m3, test.statistic = "F")
plot(lc_leafd15N_m3)
qqPlot(resid(lc_leafd15N_m3))
# transformation works. no indication of interaction


# only fertilised plot
lc_leafd15N_fm1 <- lmer(1/LCratio ~ leaf_d15N * horizon + (1|id), 
                        filter(LCratio_d, treatment == "fertilised"))
Anova(lc_leafd15N_fm1, test.statistic = "F")
plot(lc_leafd15N_fm1)
qqPlot(resid(lc_leafd15N_fm1))
