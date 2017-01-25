library(dplyr)

features <- read.delim("./features.txt",header=FALSE, sep = "")      
a_labels <- read.delim("./activity_labels.txt",header=FALSE, sep = "")      

x_train <- read.delim("./train/X_train.txt",header=FALSE, sep = "")      
y_train <- read.delim("./train/y_train.txt",header=FALSE, sep = "")      
s_train <- read.delim("./train/subject_train.txt",header=FALSE, sep = "")
names(x_train) <- features$V2
names(y_train) <- "activity"
names(s_train) <- "subject"
x_train <- cbind(x_train, s_train, y_train)

x_test <- read.delim("./test/X_test.txt",header=FALSE, sep = "")      
y_test <- read.delim("./test/y_test.txt",header=FALSE, sep = "")      
s_test <- read.delim("./test/subject_test.txt",header=FALSE, sep = "")
names(x_test) <- features$V2
names(y_test) <- "activity"
names(s_test) <- "subject"
x_test <- cbind(x_test, s_test, y_test)

x_total <- rbind(x_train,x_test)             
x_total <- x_total[ !duplicated(names(x_total)) ]
x_total <- select(x_total,activity,subject,contains("mean()"),contains("std()"))
x_total[,1] <- factor(x_total[,1],labels = a_labels$V2)

tidydataset <- x_total %>% 
      group_by(activity,subject) %>% 
      summarise_each(funs(mean))
write.table(tidydataset,"tidydataset.txt",row.name=FALSE)  

