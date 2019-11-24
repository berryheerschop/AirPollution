



complete <- function(directory,id=1:332){
  
  library(dplyr)
  
  # define the directory with the csv-files
  
  data_dir <- file.path(getwd(),directory)
  
  #list the files in the directory
  files <- list.files(path=data_dir)
  
  #select only the files specified in the id argument
  file_selection <- files[id]
  
  dir_file_selection <- file.path(data_dir,file_selection)
  
  #create empty dataframe
  all_complete_data <-data.frame()
  
  #determine the number of files to be analyzed in the for loop
  num_files <- 1:length(id)
  
  #analyze every file
  for (i in num_files) {
    #read file i
    file_read <- read.csv(dir_file_selection[i])
    
    file_first_row <- file_read[1,]
    
    id_file <- select(file_first_row,ID)
    
    complete_obs <-complete.cases(file_read)
    
    num_complete <- sum(complete_obs)
    
    relevant_cols <-cbind(id_file,num_complete)
    
    all_complete_data <-rbind(relevant_cols,all_complete_data)
    
    
    
  }
  #print(id_file)
  #print(complete_obs)
  print(all_complete_data)
  
  
  
}