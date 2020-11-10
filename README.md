# Stock-Market-Sentiment-Analysis

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT) ![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen) ![Python](https://upload.wikimedia.org/wikipedia/commons/3/34/Blue_Python_3.6_Shield_Badge.svg)

<p align="center">
    <a href="https://www.buymeacoffee.com/wyavs" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="35px"></a>
</p>

![Stock Market](https://github.com/gandalf1819/Stock-Market-Sentiment-Analysis/blob/master/stock-market.jpg)

Identification of trends in the stock prices of a company by performing fundamental analysis of the company. News articles were provided as training data-sets to the model which classified the articles as positive or neutral. Sentiment score was computed by calculating the difference between positive and negative words present in the news article. Comparisons were made between the actual stock prices and the sentiment scores. Naive Bayes, OneR and Random Forest algorithms were used to observe the results of the model using Weka

Stock Prices are considered to be very dynamic and susceptible to quick changes because of the underlying nature of the financial domain and in part because of the mix of known parameters (Previous Days Closing Price, P/E Ratio etc.) and unknown factors (like Election Results, Rumors etc.) An intelligent trader would predict the stock price and buy a stock before the price rises, or sell it before its value declines. Though it is very hard to replace the expertise that an experienced trader has gained, an accurate prediction algorithm can directly result into high profits for investment firms, indicating a direct relationship between the accuracy of the prediction algorithm and the profit made from using the algorithm.
In practice, there are 2 Stock Prediction Methodologies:
Fundamental Analysis: Performed by the Fundamental Analysts, this method is concerned more with the company rather than the actual stock. The analysts make their decisions based on the past performance of the company, the earnings forecast etc.
Technical Analysis: Performed by the Technical Analysts, this method deals with the determination of the stock price based on the past patterns of the stock (using time-series analysis.)
When applying Machine Learning to Stock Data, we are more interested in doing a Technical Analysis to see if our algorithm can accurately learn the underlying patterns in the stock time series. This said, Machine Learning can also play a major role in evaluating and forecasting the performance of the company and other similar parameters helpful in Fundamental Analysis. In fact, the most successful automated stock prediction and recommendation systems use some sort of a hybrid analysis model involving both Fundamental and Technical Analysis.

In practice, there are 2 Stock Prediction Methodologies:
# Fundamental Analysis: 
Performed by the Fundamental Analysts, this method is concerned more with the company rather than the actual stock. The analysts make their decisions based on the past performance of the company, the earnings forecast etc.

## Technical Analysis: 
Performed by the Technical Analysts, this method deals with the determination of the stock price based on the past patterns of the stock (using time-series analysis.)


# System Design

![picture1](https://user-images.githubusercontent.com/22028693/48114922-f5804f80-e22e-11e8-8169-c61c9702c6ec.png)

## News Collection
We collected State Bank India’s (SBI) data for past three months, from 1 Feb 2017 to 30 April 2017. This data includes major key events news articles of the company and also daily stock prices of SBIN for the same time period. Daily stock prices contain six values as Open, High, Low, Close, Adjusted Close, and Volume. For integrity throughout the project, we considered Adjusted Close price as everyday stock price. We have collected this data from major news aggregators such as news.google.com, reauters.com, finance.yahoo.com.

## Pre Processing
Text data is unstructured data. So, we cannot provide raw test data to classifier as an input. Firstly, we need to tokenize the document into words to operate on word level. Text data contains more noisy words which are not contributing towards classification. So, we need to drop those words. In addition, text data may contain numbers, more white spaces, tabs, punctuation characters, stop words etc. We also need to clean data by removing all those words.
2.3 Sentiment Detection Algorithm
For automatic sentiment detection of news articles, we are following Dictionary based approach which uses Bag of Word technique for text mining. This method is based on the research of J. Bean in his implementation of Twitter sentiment analysis for airline companies. To build the polarity dictionary, we need two types of words collection; i.e. positive words and negative words. Then we can match the article’s words against both these words list and count numbers of words appears in both the dictionaries and calculate the score of that document. 
We created the polarity words dictionary using general words with positive and negative polarity.

## Algorithm: 
1. Tokenize the document into word vector. 
2. Prepare the dictionary which contains words with its polarity (positive or negative) 
3. Check against each word weather it matches with one of the word from positive word dictionary or negative words dictionary. 
4. Count number of words belongs to positive and negative polarity. 
5. Calculate Score of document = count (pos.matches) – count (neg.matches) 
6. If the Score is 0 or more, we consider the document is positive or else, negative.

 
## Classifier Learning
As most of the research shows that ZeroR, Random Forest and Naïve Bayes classification algorithms performs good in text classification. So, we are considering all three algorithms to classify the text and check each algorithm’s accuracy. We can compare all the results such as accuracy, precision, recall and other model evaluation methods. All three classification algorithms are implemented and tested using Weka tool.

# Graph Analysis

## Sentiment Graph
![sentiment-graph](https://user-images.githubusercontent.com/22028693/48115265-53616700-e230-11e8-9636-720df704bb37.png)

## Emotions Graph
![emotions-graph](https://user-images.githubusercontent.com/22028693/48115217-2dd45d80-e230-11e8-9f26-f9b48e80fd74.png)

## Polarity Vs Date
![1](https://user-images.githubusercontent.com/22028693/48115391-ba7f1b80-e230-11e8-936c-919f0c5953c2.png)

## Closing Price
![2](https://user-images.githubusercontent.com/22028693/48115427-dbe00780-e230-11e8-8762-2bc14fb89a46.png)

## Average Price
![3](https://user-images.githubusercontent.com/22028693/48115448-edc1aa80-e230-11e8-821a-9ba6603db26f.png)

# Weka Analysis
## Results of Polarity Detection Algorithm for Test Dataset – April’17

01. 01-04-2017   1   Positive 
02. 05-04-2017  -3   Negative
03. 19-04-2017   5   Positive
04. 20-04-2017  -10  Negative 
05. 23-04-2017   2   Positive
06. 24-04-2017   1   Positive
07. 25-04-2017  -6   Negative
08. 26-04-2017   17  Positive
09. 27-04-2017   0   Positive
10. 28-04-2017  -2   Negative
11. 29-04-2017  -9   Negative
12. 30-04-2017   6   Positive

## Naïve Bayes Classification Results:

=== Predictions on test set ===

    inst#     actual  predicted error prediction
        1        1:?      2:pos       1 
        2        1:?      2:pos       1 
        3        1:?      1:neg       1 
        4        1:?      2:pos       1 
        5        1:?      2:pos       1 
        6        1:?      1:neg       1 
        7        1:?      2:pos       1 
        8        1:?      2:pos       1 
        9        1:?      1:neg       0.996 
       10        1:?      2:pos       1 
       11        1:?      1:neg       1 
       12        1:?      2:pos       1 

## ZeroR Classification Results:

=== Predictions on test set ===

    inst#     actual  predicted error prediction
        1        1:?      2:pos       0.653 
        2        1:?      2:pos       0.653 
        3        1:?      2:pos       0.653 
        4        1:?      2:pos       0.653 
        5        1:?      2:pos       0.653 
        6        1:?      2:pos       0.653 
        7        1:?      2:pos       0.653 
        8        1:?      2:pos       0.653 
        9        1:?      2:pos       0.653 
       10        1:?      2:pos       0.653 
       11        1:?      2:pos       0.653 
       12        1:?      2:pos       0.653 

## OneR Classification Results:

=== Predictions on test set ===

    inst#     actual  predicted error prediction
        1        1:?      2:pos       1 
        2        1:?      2:pos       1 
        3        1:?      1:neg       1 
        4        1:?      2:pos       1 
        5        1:?      2:pos       1 
        6        1:?      2:pos       1 
        7        1:?      1:neg       1 
        8        1:?      2:pos       1 
        9        1:?      2:pos       1 
       10        1:?      1:neg       1 
       11        1:?      1:neg       1 
       12        1:?      2:pos       1

## Random Forest Classification Results:

=== Predictions on test set ===

    inst#     actual  predicted error prediction
        1        1:?      2:pos       0.8 
        2        1:?      2:pos       0.72 
        3        1:?      2:pos       0.58 
        4        1:?      2:pos       0.65 
        5        1:?      2:pos       0.77 
        6        1:?      2:pos       0.68 
        7        1:?      2:pos       0.65 
        8        1:?      2:pos       0.73 
        9        1:?      2:pos       0.57 
       10        1:?      2:pos       0.75 
       11        1:?      1:neg       0.51 
       12        1:?      2:pos       0.77 

## Contributions

Please feel free to create a Pull Request for adding implementations of the algorithms discussed in different frameworks or improving the existing implementations

## Support

If you found this useful, please consider starring(★) the repo so that it can reach a broader audience

## License

This project is licensed under the MIT License

