# simple R code
# for calculating body surface area of patient using body weight (kg) and height (cm)
# employing the Mosteller Equation

# sample wt and ht

wt <- 70
ht <- 170

bsa <- sqrt( wt * ht / 3600 )
print(bsa)

# as a function

bsa_mosteller <- function(wt, ht) 
  return( sqrt( wt * ht / 3600 ) )
  
 
