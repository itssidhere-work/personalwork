library(readxl)


Dir_loc_1 <- "Folder Location 1"
Dir_loc_2 <- "Folder Location 2"
Dir_loc_3 <- "Folder Location 3"

Dir_loc <- list(Dir_loc_1,Dir_loc_2,Dir_loc_3)
## List the data from each file location and add to the data base ##

i <- 1 ## Assign i to 1 to start

for(i in 1:length(Dir_loc)) # Add a for loop to fetch the data one by one from location 
{
 if(i == 1)
   { 
   file_list <- list.files(Dir_loc[[i]][1],pattern = "*.xlsx", full.names = T,recursive = T) 
   } 
    else
   {
 if(i == 2)
   {
   file_list_1 <- append(file_list,list.files(Dir_loc[[i]][1],pattern = "*.xlsx", full.names = T,recursive = T))
   } 
    else
   file_list_2 <- append(file_list_1,list.files(Dir_loc[[i]][1],pattern = "*.xlsx", full.names = T,recursive = T))
   } 
i <- i + 1
}


### Fetching the data from the file and load it into a single data table for analysis ###


Data <- lapply(file_list_2, function(path) {
  df <- read_xlsx(path, sheet = "Sheet", skip = 4)
  df[["File Name"]] <- rep(path, nrow(df))   #add file location as a column to the data table
  df
})

