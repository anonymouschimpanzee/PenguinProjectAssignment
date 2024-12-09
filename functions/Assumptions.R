## ---------------------------
##
## Script name: Assumptions.r
##
## Purpose of script: 
##      # A file for assumptions checking
##
## Author: Jiya Soomal
##
## Date Created: 2024-12-09
##
##
## ---------------------------


# ----------------------------------Histogram-----------------------------------
histogram_length <- function(penguins_clean){
  ggplot(penguins_clean, aes(x=culmen_length_mm)) + 
    geom_histogram()+
    facet_wrap(~species, ncol =1)+
  xlab("Culmen Depth (mm)")
}



