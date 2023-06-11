---
title: "Web scraping using R and rvest"
teaching: 45
exercises: 0
source: Rmd
---

:::::::::::::::::::::::::::::::::::::: questions 

- How can scraping a web site be automated?
- How can I setup a scraping project using R and rvest?
- How do I tell rvest what elements to scrape from a webpage?
- What to do with the data extracted with rvest?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Setting up an rvest project.
- Understanding the various elements of an rvest project.
- Scrape a website and extract specific elements.
- Plot scraped data.
- Store the extracted data.

::::::::::::::::::::::::::::::::::::::::::::::::

## Introduction

The `rvest` package allows us to scrape data from a website. We
will obtain the list of Brazilian senators and plot the number
of senators each political party has.

## Setup the environment

```r
library(rvest)
library(httr)
library(ggplot2)
library(stringr)
```

The additional libraries are 
- `httr` for controling downloads
- `ggplot2` plotting the data
- `stringr` string manipulations to process the data

## Get the website

```r
BR_sen_html <- read_html(
  GET("https://www25.senado.leg.br/web/senadores/em-exercicio",
  timeout(600)))
# Check type of document
class(BR_sen_html)
# Examine the first few lines of the document
BR_sen_html
```

Now, check the type of document and examine the first few lines:
```r
class(BR_sen_html)
BR_sen_html
```

## Extract the data

Examining the source html page, all names are in
a table with the id `id="senadoresemexercicio-tabela-senadores"`
Let us extract this table:

```r
BR_sen_df <- BR_sen_html %>%
  html_element("#senadoresemexercicio-tabela-senadores") %>%
  html_table()
```

Let us view the first few rows

``r
head(BR_sen_df)
```

## Clean the data

Each region has three senators, but the table also
contains lines with redundant information for the region
Since we want to analyze the data, we want to remove
these lines. We also want to substitute state
name abbreviations by the full names.  We first create
a dataframe with the names and abbreviations, and
then create a vector we can use to substitute abbreviations
for full names:

```r
BR_sen_regions_df <- as.data.frame(str_split_fixed(BR_sen_df$UF, " - ", 2))
BR_sen_regions_df <- BR_sen_regions_df[c(seq(1,108,4)),]
bbr_replacements <- as.character(BR_sen_regions_df$V2)
names(abbr_replacements) <- BR_sen_regions_df$V1
```

We now remove the extra rows from the data frame:

```r
BR_sen_df <- BR_sen_df[!grepl(' - ',BR_sen_df$Nome),]
```

and then replace the abbreviations

```r
BR_sen_df$UF <- str_replace_all(BR_sen_df$UF,abbr_replacements)
```

## Plot a portion of the data

With the clean data, we can plot the number of senators each party has,

```r
g <- ggplot(BR_sen_df,aes(y=Partido))
g + geom_bar()
```

## Save the data

Finally, we can save the data in a csv file:

```r
write.csv(BR_sen_df,file="BrazilianSenateMembers.csv")
```

## References

* [Hadley Wickham "Web scraping 101"](https://rvest.tidyverse.org/articles/rvest.html)
* [yusuzech "Web Scarping Cheat Sheet"](https://github.com/yusuzech/r-web-scraping-cheat-sheet)
* [Antoine Soetewey and Pietro Zanotta "Web scraping in R"](https://statsandr.com/blog/web-scraping-in-r/)
* [Petr Bouchal "Crawling through a web labyrinth using {rvest}"](https://petrbouchal.xyz/post/rvest-time/)
* [Oxylabs "Web Scraping With R"](https://github.com/oxylabs/web-scraping-r)


::::::::::::::::::::::::::::::::::::: keypoints 

- rvest is an R package that can be use to scrape content from the web.
- With rvest, we can define what elements to scrape from a page.
- By using R to scrape the data, analysis can also be done on the scraped data.

::::::::::::::::::::::::::::::::::::::::::::::::
