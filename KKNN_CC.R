#CLEARING ENVIRONMENT
rm(list = ls())

# LOAD KKNN PACKAGE
library(kknn)

# DATA LOADING 
data <- read.table("/Users/pc/Desktop/working/credit_card_data.txt", stringsAsFactors = FALSE, header = FALSE)

# QUICK LOOK FOR LOADED DATA  
head(data)
str(data)
plot(data)

#SETTING RANDOM NUM GENERATOR SEED FOR REPRODUCIBILITY
set.seed(1)

#KKNN MODEL, FINDING OPTIMAL k USING Leave One Out Cross Validation 
modelkknn <- train.kknn(V11~.,data,kmax=100,scale=T)
modelkknn

#APPLY OPTIMAL k = 58 to KKNN MODEL
k=58
modelkknn_opt <- kknn(V11~.,train=data, test=data,k=k,scale=T)

#ROUND OF PREDICTION RESULTS TO 0 OR 1 
predicted <- as.integer(fitted(modelkknn_opt)+0.5)

#CALCULATE PERCENT OF CORRECT PREDICTIONS
sum(predicted == data[,11]) / nrow(data)

