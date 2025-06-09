# Sector-Comparison-1
This project is a stock return analysis of stocks in three different sectors: technology, energy and finance.

I have decided to evaluate: Nvidia(NVDA), ExxonMobil(XOM) and JPMorgan(JPM).

My goal was to understand return calculation and portfolio performance by first building the logic manually using quantmod in R, and then leveraging Performance Analytics for cleaner risk-return analysis.

## Process and Insights

I used quantmod to retrieve data from NVDA, XOM AND JPM. I noticed they all started trading in 2007 so there was no need to adjust where I started looking at data. I started by exploring the structure of the data, which included Open, High, Low, Close, Volume, and Adjusted.

I decided to delve into data for Close and Adjusted prices. I initially plotted simple plots for adjusted and close prices separately for each stock, I found that the graphs for NVDA close and adjusted prices looked very similar, same for JPM. The only one that showed a stark difference was XOM. 

I then looked at daily arithmetic returns using dailyReturn() on the Adjusted price series. The daily return graphs show how much each stock’s price changed from one trading day to the next.
These plots are visually noisy because returns fluctuate frequently showing a lot of volatility. For more meaningful insights, I calculated cumulative returns to view smoother, long-term trends.



