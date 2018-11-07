'
Script      : util
Created     : March, 2015
Author(s)   : iHub Research
Version     : v1.0
License     : Apache License, Version 2.0

Description : utility functions for the sentiment analyzer.
'
GetAfinnWordlist <- function() {
  # ===========================================================================
  # Fetch the AFINN wordlist
  # ===========================================================================
  afinn_list <- read.delim(file='C:/Users/Chinmay/Desktop/Tweets_R/Tweets_R/data/AFINN-111.txt', header=FALSE,
                           stringsAsFactors=FALSE)
  
  names(afinn_list) <- c('word', 'score')
  
  afinn_list$word <- tolower(afinn_list$word)
  
  return(afinn_list)
}

GetPositiveWords <- function() {
  # ===========================================================================
  # Fetch positive words from file
  # ===========================================================================
  positive.words <- readLines("C:/Users/Chinmay/Desktop/Tweets_R/Tweets_R/data/positive-words.txt", encoding="latin1")
  
  return(positive.words)
}

GetNegativeWords <- function() {
  # ===========================================================================
  # Fetch negative words from file
  # ===========================================================================
  negative.words <- readLines("C:/Users/Chinmay/Desktop/Tweets_R/Tweets_R/data/negative-words.txt", encoding="latin1")
  
  return(negative.words)
}

GetPositiveText <- function() {
  # ===========================================================================
  # Fetch positive polarity data
  # ===========================================================================
  pos.tweets <- readLines("C:/Users/Chinmay/Desktop/Tweets_R/Tweets_R/data/positive-tweets.txt", encoding="UTF-8")
  pos.reviews <- readLines("C:/Users/Chinmay/Desktop/Tweets_R/Tweets_R/data/rt-polarity-pos.txt", encoding="latin1")
  
  return(append(pos.tweets, pos.reviews))
}

GetNegativeText <- function() {
  # ===========================================================================
  # Fetch negative polarity data
  # ===========================================================================
  neg.tweets <- readLines("C:/Users/Chinmay/Desktop/Tweets_R/Tweets_R/data/negative-tweets.txt", encoding="UTF-8")
  neg.reviews <- readLines("C:/Users/Chinmay/Desktop/Tweets_R/Tweets_R/data/rt-polarity-neg.txt", encoding="latin1")
  
  return(append(neg.tweets, neg.reviews))
}

GetNeutralText <- function() {
  # ===========================================================================
  # Fetch neutral polarity data
  # ===========================================================================
  neutral.tweets <- readLines("C:/Users/Chinmay/Desktop/Tweets_R/Tweets_R/data/neutral-tweets.txt", encoding="UTF-8")
  
  return(neutral.tweets)
}