# preparation step
# Show working directory
getwd()


#unzip the zipfile containing the data

unzip("rprog_data_specdata.zip")

pollutantmean <- function(directory=getwd(), pollutant, id=1:332){
  
  # define the directory with the csv-files
  data_dir <- file.path(getwd(),"specdata")
  
  #list the files in the directory
  files <- list.files(path=data_dir) 
  
  #select only the files specified in the id argument
  file_selection <- files[id]
  dir_file_selection <- file.path(data_dir,file_selection)
  
  i<- 1
  for (i in length(dir_file_selection)){
    file_read <- read.csv(dir_file_selection[i])
    file_read
    i<- i+1
    
  }
  
}
pollutantmean(directory = getwd(),test,id=1:5)
