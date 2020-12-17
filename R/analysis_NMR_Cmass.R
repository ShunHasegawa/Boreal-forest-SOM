# Here we will Estimate the relative contribution compounds (carbohydrate,
# protein, lignin and aliphatic) to the total soil C pool from 13C-NMR using the
# molecular mixing model following Nelson and Baldock 2005
# (https://link.springer.com/article/10.1007%2Fs10533-004-0076-3)


# A function to solve the mixing model that estimates four compounds
# (carbohydrate, protein, lignin, aliphatic). The parameters are obtained from
# Nelson and Baldock 2005
get_NMR_comp_prop_4 <- function(ns, as, bs, xs, ds,
                                aa = 0.000, ab = 0.396, ac = 0.105, ad = 0.756, 
                                ba = 0.790, bb = 0.021, bc = 0.125, bd = 0.090, 
                                nb = 0.320, nc = 0.000, nd = 0.000){
  # ns: N:C ratio
  # as: alkyl C
  # bs: O-alkyl C
  # xs: carbonyl C
  # ds: Aromatic C
  c1 <- c(1, 1, 1, 1)
  c2 <- c(aa, nb, nc, nd)
  c3 <- c(aa, ab, ac, ad)
  c4 <- c(ba, bb, bc, bd)
  cs <- rbind(c1, c2, c3, c4)
  ss <- c(1, ns, as, bs)
  d <- data.frame(comp = c("carbohydrate", "protein", "lignin", "aliphatic"),
                  prop = solve(cs, ss)) %>% 
    spread(comp, prop)
  return(d)
}

# Estimate C mass for each compound types
nmr_comp_mass <- adply(nmr_raw_d, 1, function(x){
  # get relative abundance of each compound
  comp_pr <- with(x, get_NMR_comp_prop_4(ns = wN/wC, 
                                         as = alkylC/100,
                                         bs = O_alkylC/100, 
                                         xs = carbonylC/100,
                                         ds = aromatic/100))
  # get area-bases mass (kg C m-2)
  comp_Cmass <- comp_pr * x$Cmass
  return(comp_Cmass)
})

# Organise the df
nmr_comp_mass_ed <- nmr_comp_mass %>% 
  select(id, horizon, location, treatment, leaf_d15N, lignin, carbohydrate) %>% 
  gather(compound, NMR_cmass, lignin, carbohydrate) %>% 
  mutate(id = as.character(id))


# fit the model
nmr_Cmass_m1 <- lmer(log(NMR_cmass) ~ compound * leaf_d15N * horizon + (1|id/horizon), nmr_comp_mass_ed)
summary(nmr_Cmass_m1)
Anova(nmr_Cmass_m1, test.statistic = "F")
qqPlot(resid(nmr_Cmass_m1))
  # A significant interaction between compound types and leaf_d15N is suggested.


# compare slopes for each horizon
emtrends(nmr_Cmass_m1, pairwise ~ compound|horizon, var = "leaf_d15N")

# get exponential rate of change (a rate of change for every one unit increase
# in leaf d15N). equal to (exp(slop)-1) * 100%
data.frame(summary(emtrends(nmr_Cmass_m1, var = "leaf_d15N"))) %>% 
  mutate(rate_change = (exp(leaf_d15N.trend) - 1) * 100)
  

# compute the maximum potential change in C mass from the low to high end of leaf d15N
d15N_range_d <- with(nmr_comp_mass_ed, 
                     expand.grid(leaf_d15N = c(min(leaf_d15N), max(leaf_d15N)),
                                 horizon   = unique(horizon),
                                 compound  = unique(compound)))
pred_nmr_Cmass <- d15N_range_d %>% 
  mutate(Cmass = exp(predict(nmr_Cmass_m1, d15N_range_d, re.form=NA))) %>% 
  group_by(leaf_d15N, compound) %>% 
  summarise(Cmass = sum(Cmass)) %>% 
  ungroup() %>% 
  spread(compound, Cmass)
pred_nmr_Cmass$lignin[2] - pred_nmr_Cmass$lignin[1]
pred_nmr_Cmass$carbohydrate[2] - pred_nmr_Cmass$carbohydrate[1]
