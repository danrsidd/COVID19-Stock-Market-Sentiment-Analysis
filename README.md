# COVID-19 & the S&P 500

## About The Project

The COVID-19 pandemic has not only had an unprecedented effect on community life, but has also significantly impacted the global economy. From retirement investments and small business operations, to large revenue impacts on the world’s foremost corporations, this pandemic has certainly fostered much difficulty. Such difficulty further exacerbates global economic obstacles.

This project intends to utilize natural language processing (NLP) and sentiment analysis to predict the performance of the United States economy. To achieve this, this project examines tweets from Twitter, analyzes their sentiments, and sees if a connection exists between digital social sentiments and stock market performance.

The following hypothesis and research questions guided this project’s research and technical development:

**Hypothesis:** Twitter sentiments influence stock market performance during a global pandemic.  
**Research Question 1:** Are Twitter sentiments able to accurately predict stock market performance during a global pandemic?  
**Research Question 2:** Do global Twitter sentiments have a significant impact on the United States’ economic performance?  
**Research Question 3:** Do positive and negative sentiments correlate with increases or decreases in market performance?

## Built With

This R script makes use of several libraries. Together these libraries and associated functions connect and authenticate a Twitter API connection, search for tweets with the given search parameters, and create a number of visualizations. ggplot2 was used to create all bar plot and line plot visualizations, while wordcloud was used to create all word cloud visualizations.

* [R](https://www.r-project.org)
* [ggplot2](https://ggplot2.tidyverse.org)
* [wordcloud](https://cran.r-project.org/web/packages/wordcloud/wordcloud.pdf)
* [Twitter API](https://twitter.com/api)

## Grab a Local Copy to Experiment With

Open your terminal and clone this repo
   ```sh
   git clone https://github.com/danrsidd/COVID19-Stock-Market-Sentiment-Analysis.git
   ```

## Usage

Although this project is situated in the context of COVID-19, simply changing search parameters (or potentially adding new parmeters) makes this script flexible for all sorts of visual Twitter sentiment analysis.

## Contribute

Interested in making a contribution? Follow the steps below!

- Fork this repository
- Create your own branch (`git checkout -b contribute/ContributionName`)
- Commit your changes (`git commit -m 'Add a change'`)
- Push to the branch you created earlier (`git push origin contribute/ContributionName`)
- Start a pull request

## Link(s)

Project Link: [github.com/danrsidd/COVID19-Stock-Market-Sentiment-Analysis](https://github.com/danrsidd/COVID19-Stock-Market-Sentiment-Analysis)
Visit the Website: [covidsentiments.com](https://covidsentiments.com)
