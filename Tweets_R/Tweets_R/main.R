'
Script      : main
Created     : March, 2015
Author(s)   : iHub Research
Version     : v1.0
License     : Apache License, Version 2.0

Description : do sentiment analysis
'
source('libraries.R')
source('sentiment.R')

data <- total.results

prediction <- predict(NaiveBayesClassifier, data)

conf.matrix <- table(prediction, data[,4], dnn=list('predicted','actual'))
