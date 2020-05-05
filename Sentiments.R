# Load the following R libraries
library(NLP)
library(twitteR)
library(syuzhet)
library(tm)
library(RColorBrewer)
library(ROAuth)
library(wordcloud)
library(ggplot2)

# Set working directory
setwd(dir="/Users/XXXX/Downloads")

# Connect to Twitter API
consumer_key <- "XXXX"
consumer_secret <- "XXXX"
access_token <- "XXXX"
access_secret <- "XXXX"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

#Conduct Twitter searches for 1000 tweets per hashtag
tweets_corona <- searchTwitter("#coronavirus", n=1000,lang = "en", since="2020-04-XX", until="2020-04-XX")
tweets_covid <- searchTwitter("#COVID19", n=1000,lang = "en", since="2020-04-XX", until="2020-04-XX")

# Convert tweet list to an actionable data frame
corona_df <- twListToDF(tweets_corona)
covid_df <- twListToDF(tweets_covid)

# View data frame to ensure searches were successful
View(corona_df)
View(covid_df)

# Save Tweet data frame backups (Delete after projkect analysis is complete)
write.csv(corona_df, "corona.csv")
write.csv(covid_df, "covid.csv")

# Assign tweet text to variable
corona_text<- corona_df$text
covid_text<- covid_df$text

# Create text corupus for each of the hashtag's tweet text from above
coronaCorpus <- Corpus(VectorSource(corona_df$text))
coronaCorpus <- tm_map(coronaCorpus, function(x) iconv(enc2utf8(x), sub = "byte"))

covidCorpus <- Corpus(VectorSource(covid_df$text))
covidCorpus <- tm_map(covidCorpus, function(x) iconv(enc2utf8(x), sub = "byte"))

# Make lowercase
coronaCorpus <- tm_map(coronaCorpus, content_transformer(tolower))
covidCorpus <- tm_map(covidCorpus, content_transformer(tolower))

# Delete punctuation, numbers, and whitespace
coronaCorpus <- tm_map(coronaCorpus, removePunctuation)
covidCorpus <- tm_map(covidCorpus, removePunctuation)
coronaCorpus <- tm_map(coronaCorpus, removeNumbers)
covidCorpus <- tm_map(covidCorpus, removeNumbers)
coronaCorpus <- tm_map(coronaCorpus, stripWhitespace)
covidCorpus <- tm_map(covidCorpus, stripWhitespace)

# Partial processing function from CateGitau (Github)
Textprocessing <- function(x)
{gsub("http[[:alnum:]]*",'', x)
  gsub('http\\S+\\s*', '', x) ## Remove URLs
  gsub('#\\S+', '', x) ## Remove Hashtags
  gsub('@\\S+', '', x) ## Remove Mentions
  gsub('[[:cntrl:]]', '', x) ## Remove Controls and special characters
  gsub("\\d", '', x) ## Remove Controls and special characters
}

# Apply text processing to corpus
coronaCorpus <- tm_map(coronaCorpus,Textprocessing)
covidCorpus <- tm_map(covidCorpus,Textprocessing)

# Remove stopwords from predetermined stopwords list (also includes common Twitter terms - ie. RT, like, etc.)
tweetStopwords <- readLines("stopwords-big")
coronaCorpus <- tm_map(coronaCorpus,removeWords,mystopwords)
covidCorpus <- tm_map(covidCorpus,removeWords,mystopwords)

# Create wordcloud
coronaCloud <- wordcloud(coronaCorpus,min.freq = 10,colors=brewer.pal(8, "Dark2"),random.color = TRUE,max.words = 1000)
covidCloud <- wordcloud(covidCorpus,min.freq = 10,colors=brewer.pal(8, "Dark2"),random.color = TRUE,max.words = 1000)

# Sentiment analysis
# Retrieving sentiments from tweet text
mysentiment_corona<-get_nrc_sentiment((corona_text))
mysentiment_covid<-get_nrc_sentiment((covid_text))

# Sentiment score calculations
Sentimentscores_corona<-data.frame(colSums(mysentiment_corona[,]))
Sentimentscores_covid<-data.frame(colSums(mysentiment_covid[,]))

# Name and bind rownames
names(Sentimentscores_corona)<-"Score"
Sentimentscores_corona<-cbind("sentiment"=rownames(Sentimentscores_corona),Sentimentscores_corona)
rownames(Sentimentscores_corona)<-NULL

names(Sentimentscores_covid)<-"Score"
Sentimentscores_covid<-cbind("sentiment"=rownames(Sentimentscores_covid),Sentimentscores_covid)
rownames(Sentimentscores_covid)<-NULL

# Create sentiment bar plots and save outputs
ggplot(data=Sentimentscores_corona,aes(x=sentiment,y=Score))+geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiment")+ylab("Score")+ggtitle("Sentiments of Tweets Using #coronavirus - (4/XX/2020)")
ggsave("corona_sentiment.png")

ggplot(data=Sentimentscores_covid,aes(x=sentiment,y=Score))+geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiment")+ylab("Score")+ggtitle("Sentiments of Tweets Using #COVID19 - (4/XX/2020)")
ggsave("covid_sentiment.png")

# Create sentiment line plots and save outputs
ggplot(Sentimentscores_corona, aes(sentiment, Score, group=1)) + xlab("Sentiment") + ylab("Score") + geom_line(size=2, color="#0081e3") + ggtitle("Sentiments of Tweets Using #coronavirus - (4/XX/2020)")
ggsave("corona_line.png")

ggplot(Sentimentscores_covid, aes(sentiment, Score, group=1)) + xlab("Sentiment") + ylab("Score") + geom_line(size=2, color="#a321ff") + ggtitle("Sentiments of Tweets Using #COVID19 - (4/XX/2020)")
ggsave("covid_line.png")






