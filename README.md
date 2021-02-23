# COVID19-Stock-Market-Sentiment-Analysis

<em>Analyzing Twitter sentiments in R (sentiment bar plots, line plots, and word clouds)</em>

<em>Method and findings explained in more detail at covidsentiments.com</em>

<em>All references used to develop this script can be found in the references section of covidsentiments.com</em>

The COVID-19 pandemic has not only had an unprecedented effect on community life, but has also significantly impacted the global economy. From retirement investments and small business operations, to large revenue impacts on the world’s foremost corporations, this pandemic has certainly fostered much difficulty. Such difficulty further exacerbates global economic obstacles.

This project intends to utilize natural language processing (NLP) and sentiment analysis to predict the performance of the United States economy. To achieve this, this project examines tweets from Twitter, analyzes their sentiments, and sees if a connection exists between digital social sentiments and stock market performance.

The following hypothesis and research questions guided this project’s research and technical development:

**Hypothesis:** Twitter sentiments influence stock market performance during a global pandemic.  
**Research Question 1:** Are Twitter sentiments able to accurately predict stock market performance during a global pandemic?  
**Research Question 2:** Do global Twitter sentiments have a significant impact on the United States’ economic performance?  
**Research Question 3:** Do positive and negative sentiments correlate with increases or decreases in market performance?

This R script makes use of several libraries. Together these libraries and associated functions connect and authenticate a Twitter API connection, search for tweets with the given search parameters, and create a number of visualizations. ggplot2 was used to create all bar plot and line plot visualizations, while wordcloud was used to create all word cloud visualizations. Although this project is situated in the context of COVID-19, simply changing search parameters (or potentially adding new parmeters) makes this script flexible for all sorts of visual Twitter sentiment analysis.

