library(tm)
library(slam)
library(tm.plugin.webmining)


write("Dates Polarity",file = "C://Users//Chinmay//Desktop//articles11_feb.txt",append=FALSE)

for (i in 1:31) {

  path1 = 'D://Documents//Projects//Stock Prediction//February/'
  
  path2 <-toString(i)
  path3 ='-02-2017_1.txt'
  date <- paste(path2,"-02-2017",sep="",collapse="")
  date
  path <- paste(path1,path2,path3,sep = "" ,collapse = "") 
  path
  path10 <- paste('"',path,'"',sep="")
  path10
  
  if(!file.exists(path)) {
    final <- paste(date,temp,sep=" ")
    write(final,file = "C://Users//Chinmay//Desktop//articles11_feb.txt",append=TRUE)
    next
  }  

text_raw <- readLines(path)
library(dplyr)
library(tidytext)


corpus <- Corpus(VectorSource(text_raw))
termfreq_control <- list(remotextvePunctuation = FALSE,
                         stemming=FALSE, stopwords=TRUE)
dtm <-DocumentTermMatrix(corpus, control=termfreq_control)
ap_td <- tidy(dtm)

ap_sentiments <- ap_td %>%
  inner_join(get_sentiments("bing"), by = c(term = "word"))

ap_sentiments

library(tidyr)
library(reshape2)

#ap_sentiments[positive,sentiment]
  
  text <- toString(ap_sentiments %>%
                     count(document, sentiment, wt = count) %>%
                     ungroup() %>%
                     spread(sentiment, n, fill = 0) %>%
                     mutate(sentiment = positive - negative) %>%
                     arrange(sentiment)
  )
  substrRight2 <- function(text,n){
    substr(text, nchar(text)-n+1, nchar(text)-1)
  }
  substrRight3 <- function(text,n){
    substr(text, nchar(text)-n+1, nchar(text)-2)
  }
  
  substrlast <- function(text,n){
    substr(text, nchar(text)-n+1, nchar(text))
  }
  textthird <- substrRight3(text,3)
  textlast <- substrlast(text,1)
  textf <- substrRight2(text,2)
  textf
  if(textf == " ") {
    final2 <- paste(date,textlast,sep=" ")
    temp <- textlast
  } else if(textf == "-"){
    final1 <- paste(date,"-",sep=" ")
    final2 <- paste(final1,textlast,sep="")
    temp <- paste("-",textlast,sep="")
  }  
  else
  {
  
    if(textthird == " ") {
      finals <- paste(date,textf,sep=" ")
      final2 <- paste(finals,textlast,sep="")
      temp <- paste(textf,textlast,sep="")
    } else if(textthird == "-"){
      date
      s <- date
      final1 <- paste(s,"-",sep=" ")
      finals <- paste(final1,textf,sep="")
      final2 <- paste(finals,textlast,sep="")
      temp1 <- paste("-",textf,sep="")
      temp <- paste(temp1,textlast,sep="")
    } 
  }
    date
    
  #textf.df = as.data.frame(do.call(rbind, ap_sentiments))
  final2
  write(final2,file = "C://Users//Chinmay//Desktop//articles11_feb.txt",append=TRUE)
  


library(ggplot2)
  
ap_sentiments %>%
  count(sentiment, term, wt = count) %>%
  ungroup() %>%
  filter(n >= 0) %>%
  mutate(n = ifelse(sentiment == "negative", -n, n)) %>%
  mutate(term = reorder(term, n)) %>%
  ggplot(aes(term, n, fill = sentiment)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  ylab("Contribution to sentiment")
}