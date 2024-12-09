#Tells you where to find the data
here::here()

#-----------------------------------------------------
#Loading cleaning and plotting function file - can be found in function folder in Project
source(here("functions","Cleaning.R"))
source(here("functions","Plotting.R"))

#Load the raw data
penguins_raw <- read.csv(here("data", "penguins_raw.csv"))

#-----------------------------------------------------
#Creating a cleaning function using our functions from the functions script - Cleaning.r 
cleaning_penguin_columns <- function(raw_data){
  print("Cleaned names, removed comments, removed empty and cols, removed delta")
  raw_data %>% 
    clean_names() %>% 
    shorten_species() %>% 
    remove_empty(c("rows", "cols")) %>% 
    select(-comments) %>% 
    select(-starts_with("delta"))
}

#Applying function to raw data to create clean data
penguins_clean <- cleaning_penguin_columns(penguins_raw)

#-----------------------------------------------------
#Checking if column names have been cleaned up
colnames(penguins_raw)
colnames(penguins_clean)
#Save the clean data into data file
write.csv(penguins_clean, here("data", "penguins_clean.csv"))

#-----------------------------------------------------
#Plotting data using functions from the functions script - Plotting.r
flipper_boxplot <- boxplot_flippers(penguins_clean)
flipper_boxplot

#Saving this plot into "figures" folder as a .png
ggsave(flipper_boxplot, 
       filename = "flipper_boxplot.png",
       path = "figures",
       device = "png",
       height = 6, width = 5, units = "in")
