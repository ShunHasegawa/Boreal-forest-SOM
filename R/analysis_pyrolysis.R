# Unknown and biproducts
pyr_unk_bip_prop <- bind_rows(pyr_L_raw_d, pyr_FH_raw_d) %>% 
  group_by(category, horizon) %>% 
  summarise(peak_area = sum(as.numeric(peak_area))) %>% 
  group_by(horizon) %>% 
  mutate(prop = (peak_area / sum(peak_area)) * 100,
         prop = round(prop, 2)) %>% 
  filter(category %in% c("CO2", "Unknown")) %>% 
  select(-peak_area) %>% 
  spread(horizon, prop)
pyr_unk_bip_prop

# Proportion without biproducts or unknown
pyr_L_spec <- pyr_L_raw_d %>% 
  filter(!(category %in% c("CO2", "Unknown"))) %>% 
  group_by(id) %>% 
  mutate(value = peak_area / sum(peak_area)) %>% 
  ungroup() %>% 
  select(-peak_area)

pyr_FH_spec <- pyr_FH_raw_d %>% 
  filter(!(category %in% c("CO2", "Unknown"))) %>% 
  group_by(id) %>% 
  mutate(value = peak_area / sum(peak_area)) %>% 
  ungroup() %>% 
  select(-peak_area)

# summary of pyrolysis products
py_prop <- rbind.fill(pyr_L_spec, pyr_FH_spec) %>% 
  select(id, horizon, location, category, compound, value) %>% 
  group_by(id, horizon, location, category) %>% 
  summarise(value = sum(value) * 100) %>% 
  group_by(horizon, location, category) %>% 
  summarise_at(.vars = vars(value), .funs = funs(M = mean, CI = get_ci)) %>% 
  ungroup() %>% 
  mutate(value = paste0(round(M, 2), "[", round(CI, 2), ']'),
         location = factor(location, levels = c("control", paste("fertilised", c("outside", "edge", "inside"), sep = ":")))) %>% 
  select(horizon, location, category, value) %>% 
  spread(category, value) %>% 
  select(horizon, location, Carbohydrate, `G-lignin`, `N-compound`, Phenol, `S-lignin`, `Aliphatic deriv.`, `Aromatic deriv.`, Others) %>% 
  arrange(horizon, location)
py_prop



# RDA -------------------------------------------------------------------


# . L horizon ----------------------------------------------------------------

# All
pyr_L_grp <- unique(pyr_L_spec$category)
pyr_L <- pyr_L_spec %>%
  group_by(category, id, leaf_d15N, location, horizon) %>% 
  summarise(value = sum(value)) %>% 
  ungroup() %>% 
  spread(category, value)
pyr_L_sp   <- decostand(select(pyr_L, one_of(pyr_L_grp)), method = "hellinger")
pyr_L_rda  <- rda(pyr_L_sp ~ leaf_d15N, pyr_L)
anova(pyr_L_rda, nperm = 4999)

# only fertilised plots
pyr_L_f <- filter(pyr_L, location != "control")
pyr_L_sp_f   <- decostand(select(pyr_L_f, one_of(pyr_L_grp)), method = "hellinger")
pyr_L_rda_f  <- rda(pyr_L_sp_f ~ leaf_d15N, pyr_L_f)
anova(pyr_L_rda_f, nperm = 4999)


# Species loading
scores(pyr_L_rda, display = "species")
scores(pyr_L_rda_f, display = "species")


# .FH horizon ----------------------------------------------------------------
pyr_FH_grp <- unique(pyr_FH_spec$category)
pyr_FH <- pyr_FH_spec %>%
  group_by(category, id, leaf_d15N, location, horizon) %>% 
  summarise(value = sum(value)) %>% 
  ungroup() %>% 
  spread(category, value)
pyr_FH_sp   <- decostand(select(pyr_FH, one_of(pyr_FH_grp)), method = "hellinger")
pyr_FH_rda  <- rda(pyr_FH_sp ~ leaf_d15N, pyr_FH)
anova(pyr_FH_rda, nperm = 4999)

# only fertilised
pyr_FH_f <- filter(pyr_FH, location != "control")
pyr_FH_sp_f   <- decostand(select(pyr_FH_f, one_of(pyr_FH_grp)), method = "hellinger")
pyr_FH_rda_f  <- rda(pyr_FH_sp_f ~ leaf_d15N, pyr_FH_f)
anova(pyr_FH_rda_f, nperm = 4999)

# Species loading
scores(pyr_FH_rda, display = "species")
scores(pyr_FH_rda_f, display = "species")
