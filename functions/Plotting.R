## ---------------------------
##
## Script name: Plotting.r
##
## Purpose of script: 
##      # A file of functions for plotting
##
## Author: Jiya Soomal
##
## Date Created: 2024-11-06 
##
##
## ---------------------------


# ----------------------------------Species Colours-----------------------------

species_colours <- c("Adelie" = "darkorange",
                     "Chinstrap" = "purple",
                     "Gentoo" = "cyan4")

# ------------------------------------------------------------------------------


# ----------------------------------Flipper Boxplot-------------------------------------
# Plot the flipper length as a boxplot of species
boxplot_flippers <- function(penguins_flippers){
  #Drop the na's 
    na.omit({{"flipper_length_mm"}})
  penguins_flippers %>% 
    ggplot(aes(x = species, y = flipper_length_mm)) +
    geom_boxplot(aes(color = species), width = 0.3, show.legend = FALSE) +
    geom_jitter(aes(color = species), alpha = 0.3, show.legend = FALSE, 
                position = position_jitter(width = 0.2, seed = 0)) +
    scale_color_manual(values = species_colours) +
    scale_x_discrete(labels=c("Adelie","Chinstrap","Gentoo")) +
    labs(x = "Penguin Species",
         y = "Flipper length (mm)") +
    theme_bw()
}
# ------------------------------------------------------------------------------



# ----------------------------------Culmen Length Boxplot-------------------------------------

# Plot the culmen length as a boxplot of species
boxplot_culmenlength <- function(data){
  #Drop the na's 
  na.omit({{"culmen_length_mm"}})
  data %>% 
    ggplot(aes(x = species, y = culmen_length_mm)) +
    geom_boxplot(aes(color = species), width = 0.3, show.legend = FALSE) +
    geom_jitter(aes(color = species), alpha = 0.3, show.legend = FALSE, 
                position = position_jitter(width = 0.2, seed = 0)) +
    scale_color_manual(values = species_colours) +
    scale_x_discrete(labels=c("Adelie","Chinstrap","Gentoo")) +
    labs(x = "Penguin Species",
         y = "Culmen length (mm)",
         title="Figure 2: Culmen Length by Species") +
    stat_compare_means(comparisons = my_comparisons, label.y = c(52, 58, 49))+
    theme_bw()
}

# ------------------------------------------------------------------------------

# ----------------------Scatter Plot - Island and Species-----------------------

scatter_culmen<- function(penguins_culmen){
  #Drop the na
  na.omit({{"culmen_length_mm"}})
  na.omit({{"culmen_depth_mm"}})
  penguins_culmen %>% 
    ggplot(aes(x = culmen_length_mm, y = culmen_depth_mm)) +
    geom_point(aes(color = species, shape = island), width = 0.5, show.legend = TRUE) +
    geom_jitter(aes(color = species, shape = island), alpha = 0.3, show.legend = TRUE, 
                position = position_jitter(width = 0.2, seed = 0)) +
    scale_color_manual(values = species_colours) +
    scale_x_discrete(labels=c("Adelie","Chinstrap","Gentoo")) +
    scale_x_continuous(breaks = seq(30, 60, by = 5)) +
    labs(x = "Culmen Length (mm)",
         y = "Culmen Depth(mm)") +
    theme_bw()+
    ggtitle("Figure 1: Culmen Morphospace for Penguin Species on Different Islands")
}

# ----------------------Saving in "figures" folder as .png -----------------------
save.png <- function(x,filename){
ggsave(x, 
       filename = filename,
       path = "figures",
       device = "png",
       height = 6, width = 9, units = "in")
}

# ----------------------Saving in "figures" folder as .svg -----------------------
save.svg <- function(x,filename){
  ggsave(x, 
         filename = filename,
         path = "figures",
         device = "svg",
         height = 6, width = 9, units = "in")
}

