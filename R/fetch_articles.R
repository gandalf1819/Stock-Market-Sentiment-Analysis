library(tm)
library(tm.plugin.webmining)

googlefinance <- WebCorpus(GoogleFinanceSource("NSE:DLF", params = list(hl = "en", q = "NSE:DLF", ie = "utf-8", start = 0, num = 50, output = "rss")))
                                                                                 
googlefinance
googlefinance$content
class(googlefinance)

fileConn <- file("D:/articles11.txt")

googlefinance[[20]]$content

meta(googlefinance[[2]])
for(i in 1:50) {
  text <- toString(meta(googlefinance[[i]]))
  write(text, file = "D:/articles11.txt", append = TRUE)
  text <- toString(googlefinance[[i]])
  write(text, file = "D:/articles11.txt", append = TRUE)
}

typeof(meta(googlefinance[[i]]))

sapply(meta(googlefinance[[1]]),class)


lapply(meta(googlefinance[[1]]), cat, "D:/test.txt", append=TRUE, ncolumns=1000)

for(i in 1:30) {
  text <- meta(googlefinance[[i]])
  text.df = as.data.frame(do.call(rbind, text))
  write.table(text.df, file = "D:/articles2.txt", append = TRUE, quote = FALSE, row.names = FALSE)
}

text <- meta(googlefinance[[1]])
text.df = as.data.frame(do.call(rbind, text))
write.table(text.df, file = "D:/articles2.txt")

close(fileConn)

#write(meta(googlefinance[[i]]), file = "articles", sep = " ", append = TRUE)
#write.table(meta(googlefinance[[i]]), "D:/articles.txt", sep = " ")
#print(meta(googlefinance[[i]]))
#print("----------------------------")


googlefinance <- corpus.update(googlefinance)

theVerge <- extractContentDOM("http://www.theverge.com/2017/4/15/15313968/star-wars-battlefront-2-official-trailer-release-2017-celebration",0.5,FALSE)
theVerge <- trimWhiteSpaces(theVerge)
theVerge

library(XML)

# Read and parse HTML file
doc.html = htmlTreeParse('http://www.theverge.com/2017/4/15/15313968/star-wars-battlefront-2-official-trailer-release-2017-celebration',
                         useInternal = TRUE)

# Extract all the paragraphs (HTML tag is p, starting at
# the root of the document). Unlist flattens the list to
# create a character vector.
doc.text = unlist(xpathApply(doc.html, '//p', xmlValue))

# Replace all \n by spaces
doc.text = gsub('\\n', ' ', doc.text)

# Join all the elements of the character vector into a single
# character string, separated by spaces
doc.text = paste(doc.text, collapse = ' ')


library(tidyverse)
library(tokenizers)

text <- readLines("D:\\articles.txt")
print(text)
words <- tokenize_words(text)
words
length(words[[1]])
tab <- table(words[[1]])
tab <- data_frame(word = names(tab), count = as.numeric(tab))
tab
arrange(tab, desc(count))

sentences <- tokenize_sentences(text)
sentences




