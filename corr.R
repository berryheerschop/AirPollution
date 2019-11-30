corr <- function(directory, treshold=0){
  
  library(dplyr)
  
  # define the directory with the csv-files
  
  data_dir <- file.path(getwd(),directory)
  
  #list the files in the directory
  files <- list.files(path=data_dir)
  
  #select only the files specified in the id argument
  file_selection <- files
  
  dir_file_selection <- file.path(data_dir,file_selection)
  
  #create empty dataframe
  all_complete_data <-data.frame()
  
  #determine the number of files to be analyzed in the for loop
  num_files <- 1:length(file_selection)
  
  #Create empty correlation vector
  correlation_vector <- c()
  
  #analyze every file
  
  for (i in num_files) {
    #read file i
    file_read <- read.csv(dir_file_selection[i])
    
    #Determine complete observations in the file
    complete_obs <-complete.cases(file_read)
  
    # count number of complete observations
    nobs_complete <- sum(complete_obs)
    
    if (nobs_complete > treshold){
      #print(dir_file_selection[i])
      file_read_complete <- file_read
      #print(nobs_complete)
      relevant_data <- file_read_complete[complete_obs,]
      #append data to empty dataframe
      #all_complete_data <-rbind(all_complete_data,relevant_data)
 
      correlation <- cor(relevant_data$nitrate,relevant_data$sulfate)
      
      correlation_vector <- c(correlation_vector,correlation)
      
    }
    

  }
  correlation_vector
  
}
