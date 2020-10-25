## 데이터 구조

dat1 = data.frame(name=c('Kim', 'Park'),
                  age=c(24, 40), 
                  height=c(180,165), stringsAsFactors=FALSE)
dat2 <- dat1


dat1[1,] <- c("Lee", 30, 170); dat1
dat2[1,] <- list("Lee", 30, 170); dat2


dat1$age
dat2$age


dat2 = data.frame(name=c('Kim', 'Park'),
                  age=c(24, 40), 
                  height=c(180,165), stringsAsFactors=TRUE)
dat2[1,] <- list("Lee", 30, 170); dat2


## 데이터 불러들이기

dat <- read.csv('서울시 한강공원 이용객 현황 (2009_2013년).csv', 
                fileEncoding = 'UTF-8-BOM')
head(dat, n=2)
# BOM
# http://blog.wystan.net/2007/08/18/bom-byte-order-mark-problem
# https://code.i-harness.com/ko-kr/q/21ef0a


dat02 <- read.csv('서울특별시 공공자전거 대여소별 이용정보(월간)_2017_1_12.csv',
                  quote="'", fileEncoding = 'CP949')
head(dat02, n=2)


dat03 <- read.csv("http://www.nber.org/data/population-birthplace-diversity/JoEG_BP_diversity_data.csv", sep=";", header=T, row.names=NULL)
head(dat03, n=2)


## EXCEL 화일 읽기
library(readxl)
dat04 <- 
  readxl::read_xlsx('서울시 한강공원 이용객 현황 (2009_2013년).xls', sheet=1) 
head(dat04, n=3)


## 그 밖의 통계 프로그램 데이터 화일
foreign::read.dta('http://www.nber.org/data/population-birthplace-diversity/JoEG_BP_diversity_data.dta')
haven::read_dta('http://www.nber.org/data/population-birthplace-diversity/JoEG_BP_diversity_data.dta')
readstata13::read.dta13('http://www.nber.org/data/population-birthplace-diversity/JoEG_BP_diversity_data.dta')


## Web에서 데이터 긁어오기
library(XML); library(RCurl); library(rlist)
url <- "https://en.wikipedia.org/wiki/List_of_Korean_surnames"
theurl <- getURL(url, .opts=list(ssl.verifypeer=FALSE))
# Windows에서 다음과 같은 에러가 발생(ubuntu는 정상작동)
# error:1407742E:SSL routines:SSL23_GET_SERVER_HELLO:tlsv1 alert protocol version
# RCurl은 더 이상 관리되지 않는다고 함.
#https://stackoverflow.com/questions/31504983/rcurl-geturl-ssl-error
library(curl)
con <- curl(url)
html <- readLines(con)

df2 <- readHTMLTable(html, header = TRUE, which = 1,
                    stringsAsFactors = FALSE, encoding = "UTF-8")
head(df2, n=1)


## 제어와 함수 I.
x ='2'
switch(x,
      "1"="one",
      "2"="two",
      "else!") # 숫자는 따옴표로 감싸야 함을 주의하자.

