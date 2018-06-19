#Installing Packages

install.packages ('tm')

install.packages ('wordcloud')

install.packages ('RColorBrewer')

#Loading Packages

library(tm)

library(wordcloud)

library(RColorBrewer)


speech = 'C:\\Users\\Trey\\Documents\\R\\Projects\\bednar.txt'

bednar_txt = readLines(speech, warn=FALSE)

bednar<-Corpus(VectorSource(bednar_txt))

bednar_data<-tm_map(bednar,stripWhitespace)

bednar_data<-tm_map(bednar_data,tolower)

bednar_data<-tm_map(bednar_data,removeNumbers)

bednar_data<-tm_map(bednar_data,removePunctuation)

bednar_data<-tm_map(bednar_data, removeWords, c('was','why','how','which','what','who','but','and','the','our','that','for','are','also','more','has','must','have','should','this','with'))

tdm_bednar<-TermDocumentMatrix (bednar_data) #Creates a TDM

TDM1<-as.matrix(tdm_bednar) #Convert this into a matrix format

v = sort(rowSums(TDM1), decreasing = TRUE) #Frequencies for every word

d <- data.frame(word = names(v),freq=v)
head(d, 100)
summary(v)
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

