# Sector-Comparison-1
This project is a stock return analysis of stocks in three different sectors: technology, energy and finance.

I have decided to evaluate: Nvidia(NVDA), ExxonMobil(XOM) and JPMorgan(JPM).

My goal was to understand return calculation and portfolio performance by first building the logic manually using quantmod in R, and then leveraging Performance Analytics for cleaner risk-return analysis.

## Process and Insights

I used quantmod to retrieve data from NVDA, XOM AND JPM. I noticed they all started trading in 2007 so there was no need to adjust where I started looking at data. I started by exploring the structure of the data, which included Open, High, Low, Close, Volume, and Adjusted.

I decided to delve into data for Close and Adjusted prices. I initially plotted simple plots for adjusted and close prices separately for each stock, I found that the graphs for NVDA close and adjusted prices looked very similar, same for JPM. The only one that showed a stark difference was XOM. 

I then looked at daily arithmetic returns using dailyReturn() on the Adjusted price series. The daily return graphs show how much each stock’s price changed from one trading day to the next.
These plots are visually noisy because returns fluctuate frequently showing a lot of volatility. For more meaningful insights, I calculated cumulative returns to view smoother, long-term trends.

To understand the long-term performance of each stock, I calculated cumulative returns using adjusted closing prices. The y-axis shows how much a £1 investment would have grown over time.

What I found:

NVDA- a £1 investment in 2007 in Nvidia would be worth £250+ by 2025, which is a massive growth, especially relative to the other two stocks. Most of this growth occured post 2016, most likely due to its dominance in AI and GPUs.

XOM- a £1 investment in 2007 in ExxonMobil would be worth around £3 by 2025. XOM showed modest growth, with returns mostly flat from 2007–2020, followed by a sharp rise post-COVID (2021–2022), likely due to energy price surges and inflationary conditions. The energy sector lags behind tech in long-term capital gains.

JPM- a £1 investment in 2007 in JPMorgan would be worth around £9 by 2025.JPM posted consistent gains with some dips (e.g., 2008, 2020), reflecting its resilience as a large-cap financial stock. Its cumulative return sits between the energy and tech sectors, with less volatility than NVDA but more upside than XOM.

### Log Returns

I also calculated log returns for each stock to compare them with arithmetic daily returns. While the graphs appear noisy, they show the day-to-day fluctuations in stock value under a continuous compounding framework — commonly used in financial modeling.

Compared to arithmetic returns, log returns are symmetrical and additive over time, making them useful for statistical analysis. However, like daily returns, they don't reveal long-term trends clearly — which is why I also looked at cumulative returns and performance summaries.


To understand the difference between Close and Adjusted prices and their differing affects on acutal return,I calculated and plotted the log returns using both Close and Adjusted prices for each stock.

For XOM and JPM, which are both dividend-paying companies, there was a visible and growing gap between cumulative Close-based returns and Adjusted-based returns. In contrast, NVDA showed almost no difference — which aligns with the fact that it rarely pays dividends and has fewer price-adjusting corporate actions.

I visualised the daily log return differences and their cumulative sum over time to see how the effect builds. This confirmed that for accurate performance analysis — especially over long horizons — Adjusted prices must be used.

### Comparing Log vs Simple Returns

To understand the practical difference between arithmetic (simple) and log returns, I plotted both for each stock.

- The black line shows cumulative returns using compounded arithmetic returns.
- The red line shows cumulative log returns using cumsum().

Across all three plots, the black line is always slightly above the red. This is expected — due to the compounding effect, simple returns tend to slightly overstate growth compared to log returns over long periods.

Notably:
- For NVDA, where returns are massive, the gap between simple and log returns becomes very large (due to compounding over 250x).
- For XOM, where returns are modest, the gap is smaller — but still noticeable over time.
- JPM shows a moderate difference, reflecting steady growth.

This illustrates that while log and simple returns are nearly identical in the short run, they diverge over long horizons — especially for volatile or high-growth stocks. Log returns remain useful for statistical modeling due to their additive property. This matters when presenting performance metrics to clients, writing reports, or comparing investment products — how returns are calculated affects the story.

**When to use which:**
- Use simple returns when reporting portfolio performance to clients or backtesting real investment strategies.
- Use log returns for modeling, regression, volatility estimation, and financial theory.



## Performance Analytics

Each chart includes: Top panel-Cumulative return, Middle panel- Daily returns, Bottom panel- Drawdowns (peak-to-trough loss)

Key insights:

- XOM and JPM show clear divergence between Close and Adjusted returns. The Adjusted returns (pink) are consistently higher, reflecting dividend payouts and other corporate actions. This confirms that Adjusted prices give a more accurate picture of investor returns, especially over long periods.
  
- 



