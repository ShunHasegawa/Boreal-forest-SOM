# leaf d15N vs. N compound
dlply(LCratio_d, .(horizon), function(x){
  cor.test(x$leaf_d15N, x$`N-compound`)
})


# Cmass ratio vs. Lignin:carbohydrate ratio
dlply(LCratio_d, .(horizon), function(x){
  cor.test(x$Cmass, 1/x$LCratio)
})
