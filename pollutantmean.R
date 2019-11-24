
pollutantmean <- function(directory,pollutant,id=1:332) {
  library(dplyr)
  
  # define the directory with the csv-files
  
  data_dir <- file.path(getwd(),directory)
  
  
  #list the files in the directory
  files <- list.files(path=data_dir)
  
  #select only the files specified in the id argument
  file_selection <- files[id]
  
  dir_file_selection <- file.path(data_dir,file_selection)
  
  #create empty dataframe
  all_pollutant_values <-data.frame()

  #determine the number of files to be analyzed in the for loop
  num_files <- 1:length(id)

  #analyze every file
  for (i in num_files) {
  #read file i
    file_read <- read.csv(dir_file_selection[i])
    
    #select only relevant pollutant column
    pollutant_values <- select(file_read,pollutant)
    
    #append data to dataframe
    all_pollutant_values <- rbind(pollutant_values,all_pollutant_values)
    
    #Determine the non missing values
    goods <- !is.na(all_pollutant_values)
    #Apply non_missing values on pollutant values
    all_non_missing_pollutant_values <- all_pollutant_values[goods]
    
    #Calculate mean value
    mean_pollutant_value <- mean(all_non_missing_pollutant_values)
    
    #Go to the next file
    i<- i+1
    
  }

  print(R.version.string)
  print(mean_pollutant_value)
  
}

