## begin code for converting txt to csv files 
fileList = list.files(pattern = "*.txt")

for (i in 1:length(fileList)){
  input = fileList[i]
  output <- paste0(gsub("\\.txt$", "", input), ".csv")
  newData = read.delim(input, header = T)
  write.table(newData, file = output, sep =",", col.names = T, row.names = F)
}

## add columns to each file
dir =setwd("~/Documents/Rproject2021/countryX/")
path1=list.files(dir) 

temp = list.files(pattern="*.csv")### getting the file names

for(i in 1: length(path1)){
  
  file_name= paste(dir, path1[i], sep="/") #### concatenating file path address
  ### read data from file
  data=read.table(file_name,header = TRUE, sep = ",",stringsAsFactors = FALSE)
  
  num_years <- as.numeric(gsub("\\D+", "", temp[i])) ## get the numeric value from file name
  
  ### adding columns to a csv file
  data1=cbind(data, Country = "X",DayofYear = num_years )
  all_data = write.csv(data1,dir, row.names = F)
}


## merge all csv files into 1 file
setwd("~/Documents/Rproject2021/countryY/")
file_list <- list.files()
for (file in file_list){
  
  # if the merged dataset doesn't exist, create it
  if (!exists("dataset")){
    dataset <- read.csv(file, header=TRUE, sep="\t")
  }
  
  # if the merged dataset does exist, append to it
  if (exists("dataset")){
    temp_dataset <-read.csv(file, header=TRUE, sep="\t")
    dataset<-rbind(dataset, temp_dataset)
    rm(temp_dataset)
  }
}
# multmerge = function(mypath){
#   filenames=list.files(path=mypath, pattern = ".csv", full.names=TRUE)
#   datalist = lapply(filenames, function(x){read.csv(file=x,header=T)})
#   Reduce(function(x,y) {merge(x,y)}, datalist)
# }
# mergedData = multmerge("~/Documents/Rproject2021/countryY")

## first add a column to each file with country name and day of year


## add each row 