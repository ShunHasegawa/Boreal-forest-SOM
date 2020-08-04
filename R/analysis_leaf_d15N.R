
# Fit a four-parameter S-shaped asymptotic regression line on leaf d15N as a
# function of distance from the edge of the experimental plots using the
# extended Weibull model

irms_lingon_trans_f <- filter(leaf_d, treatment == "fertilised") %>% 
  mutate(distance2 = distance + 100)

# starting values
iv <- getInitial(leaf_d15N ~ SSweibull(distance2, Asym, Drop, lrc, pwr), data = irms_lingon_trans_f) 
nm1 <- nls(leaf_d15N ~ Asym - Drop * exp(-exp(lrc) * distance2^pwr), start = iv, data = irms_lingon_trans_f)
summary(nm1)

# get predictive line from the above model
predd <- data.frame(distance2 = seq(0, 200, length.out = 100)) %>% 
  mutate(leaf_d15N = predict(nm1, list(distance2 = distance2)),
         distance  = distance2 - 100, 
         treatment = "fertilised")
trt_lab_dc <- data.frame(distance = c(-65, 0, 65),
                         treatment = "fertilised",
                         leaf_d15N = min(leaf_d$leaf_d15N),
                         location = c("Inside", "Edge", "Outside"))

# make a plot
leafd15N_p <- ggplot(leaf_d, aes(x = distance, y = leaf_d15N))+
  geom_vline(data = filter(leaf_d, treatment == "fertilised"),
             aes(xintercept = -20), linetype = "dotted", col = "gray") +
  geom_vline(data = filter(leaf_d, treatment == "fertilised"),
             aes(xintercept = 20), linetype = "dotted", col = "gray") +
  geom_point(size = 2, alpha = .8, color = "gray30") +
  geom_line(data = predd, aes(x = distance, y = leaf_d15N), size = 1, col = "black")+
  labs(x = "Distance from the edge of plot (m)", y = expression(paste("Leaf ", delta^{15}, "N (\u2030)")))+
  theme(legend.position = c(.1, .15),
        legend.title    = element_blank())+
  facet_grid(. ~ treatment, scales = "free_x", space = "free_x") +
  geom_text(data = trt_lab_dc, aes(x = distance, y = leaf_d15N, label = location),
            fontface = "italic", nudge_y = -.3, size = 3)
leafd15N_p
