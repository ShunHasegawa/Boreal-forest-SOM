# Proportion of each compound group -------------------------------------
NMR_compounds <- c("alkylC", "meth_N_alkylC", "O_alkylC", "di_O_alkylC", "aromatic", "O_aromaticC", "carbonylC")
nmr_prop <- nmr_raw_d %>% 
  gather(key = compound, prop, one_of(NMR_compounds)) %>% 
  group_by(horizon, treatment, compound, location) %>% 
  summarise_at(.vars = vars(prop), .funs = funs(M = mean, CI = get_ci)) %>% 
  ungroup() %>% 
  mutate(value = paste0(round(M, 2), "[", round(CI, 2), ']'),
         location = factor(location, levels = c("control", paste("fertilised", c("outside", "edge", "inside"), sep = ":")))) %>% 
  select(horizon, location, compound, value) %>% 
  spread(compound, value) %>% 
  select(horizon, location, carbonylC, O_aromaticC, aromatic,  di_O_alkylC, O_alkylC, meth_N_alkylC, alkylC) %>% 
  arrange(horizon, location)


# RDA -------------------------------------------------------------------

# . Litter ----------------------------------------------------------------

# all
nmr_L <- filter(nmr_raw_d, horizon == "L horizon")
nmr_L_sp  <- decostand(select(nmr_L, one_of(NMR_compounds)), method = "hellinger")
nmr_L_rda  <- rda(nmr_L_sp ~ leaf_d15N, nmr_L)
anova(nmr_L_rda, nperm = 4999)
summary(nmr_L_rda)
# Species loading
scores(nmr_L_rda, display = "species", scaling = 3)

# only fertilised plots
nmr_L_f <- filter(nmr_raw_d, horizon == "L horizon" & treatment == "fertilised")
nmr_L_sp_f  <- decostand(select(nmr_L_f, one_of(NMR_compounds)), method = "hellinger")
nmr_L_rda_f  <- rda(nmr_L_sp_f ~ leaf_d15N, nmr_L_f)
anova(nmr_L_rda_f, nperm = 4999)

# Species loading
scores(nmr_L_rda_f, display = "species", scaling = 3)


# . F/H horizon ----------------------------------------------------------------

# all
nmr_FH <- filter(nmr_raw_d, horizon == "F/H horizon")
nmr_FH_sp  <- decostand(select(nmr_FH, one_of(NMR_compounds)), method = "hellinger")
nmr_FH_rda  <- rda(nmr_FH_sp ~ leaf_d15N, nmr_FH)
anova(nmr_FH_rda, nperm = 4999)
summary(nmr_FH_rda)
# Species loading
scores(nmr_FH_rda, display = "species", scaling = 3)


# only fertilised plots
nmr_FH_f <- filter(nmr_raw_d, horizon == "F/H horizon" & treatment == "fertilised")
nmr_FH_sp_f  <- decostand(select(nmr_FH_f, one_of(NMR_compounds)), method = "hellinger")
nmr_FH_rda_f  <- rda(nmr_FH_sp_f ~ leaf_d15N, nmr_FH_f)
anova(nmr_FH_rda_f, nperm = 4999)


# Species loading
scores(nmr_FH_rda_f, display = "species", scaling = 3)
