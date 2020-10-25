## 6 날짜와 시간

## 6.1 R의 날짜와 시간

dateNow <- Sys.Date()
print(dateNow)
class(dateNow)


timeNow <- Sys.time()
print(timeNow)
class(timeNow)


unclass(dateNow); print.default(dateNow)
unclass(timeNow); print.default(timeNow)

## 6.2 날짜의 표기

## ISO 8601

## 스타일   표기            의미                     예
## 기본형 (+-)YYYYMMDD    년월일                  20200103
## 확장형 (+-)YYYY-MM-DD  년-월-일                2020-01-03
## 기본형 (+-)YYYYDDD     년일(1년의 몇번째 일)   2020003
## 확장형 (+-)YYYY-DDD    년-일(1년의 몇번째 일)  2020-003
## 기본형 (+-)YYYYWwwD    년주일                  2020W013
## 확장형 (+-)YYYY-Www-D  년-W주-일               2020-W01-3


## 6.2.2

## ISO 8601 시간

## 스타일     표기                      의미
## 기본형  hhmmss(,ss)(Z)(+-hh(:)mm)    시분초(,100분의 1초)(Z)(타임존)
## 확장형  hh:mm:ss(,ss)(Z)(+-hh(:)mm)  년-월-일(,100분의 1초)(Z)(타임존)

## 6.3 날짜 표기 변환

x <- Sys.time()

format(x, '%Y-%m-%d %H:%M:%S')
format(x, '%Y-%jT%H:%M:%S')
format(x, '%G-W%V-%u %H:%M:%S')


## 기호   의미
## %Y     4자리 년
## %G     4자리 년 
## %m     2자리 월
## %d     2자리 (월 중) 일(01-31)
## %H     2자리 시간(00-23)
## %M     2자리 분(00-59)
## %S     2자리 초(00-59)
## %j     3자리 (년 중) 일(001-366)
## %V     2자리 (년 중) 주(01-53)
## %u     1자리 (주 중) 일(1-7, 1=월요일)

for (y in 2020:2023) 
  print(format(as.Date(paste0(y, '-01-01', sep='')), '%Y/%m/%d, V=%V U=%U u=%u w=%w A=%A a=%a'))

## 6.4 날짜시간 표기 인식

## 6.4.1 ISO 8601


## ISO 8601 

##   표기            의미                     예        날짜로 변환
##  (+-)YYYYMMDD    년월일                  20200103    format='%Y%m%d'
##  (+-)YYYY-MM-DD  년-월-일                2020-01-03  format='%Y-%m-%d'
##  (+-)YYYYDDD     년일(1년의 몇번째 일)   2020003     format='%Y%j'
##  (+-)YYYY-DDD    년-일(1년의 몇번째 일)  2020-003    format='%Y-%j'
##  (+-)YYYYWwwD    년주일                  2020W013
##  (+-)YYYY-Www-D  년-W주-일               2020-W01-3

install.packages("parsedate")

library(parsedate)
as.Date('20210102', format='%Y%m%d'); as.Date(parse_iso_8601('20210102'))
as.Date('2021-01-02', format='%Y-%m-%d'); as.Date(parse_iso_8601('2021-01-02'))


as.Date('2021002', format='%Y%j'); as.Date(parse_iso_8601('2021002'))
as.Date('2021-002', format='%Y-%j'); as.Date(parse_iso_8601('2021-002'))

as.Date(parse_iso_8601('2020W536'))
as.Date(parse_iso_8601('2020-W53-6'))


library(magrittr)
as.Date('Jan 01 2020', format='%b %d %Y')
as.Date('January 01 2020', format='%B %d %Y')
Sys.getlocale("LC_ALL") %>% strsplit(";")


#Sys.setlocale("LC_ALL", "English") %>% strsplit(";") 
#Ubuntu에서는 다음과 같은 메시지가 나올 수 있다. 
# WARNING: OS reports request to set locale to "English" cannot be honored
#locale -a 를 통해 설치된 locale을 확인할 수 있다. 
Sys.setlocale("LC_ALL", "C") %>% strsplit(";")
as.Date('Jan 01 2020', format='%b %d %Y')
as.Date('January 01 2020', format='%B %d %Y')

Sys.setlocale("LC_ALL", "Korean") %>% strsplit(";")
# ubuntu라면,
# sudo apt-get install -y locales locales-all
# 에서 모든 locale을 설치할 수 있다. 그리고,
# Sys.setlocale("LC_ALL", "ko_KR.UTF-8") %>% strsplit(";")


as.Date('March 01 2020', format='%B %d %Y')
as.Date('Mars 01 2020', format='%B %d %Y') 

install.packages("lubridate")

library(lubridate)

mdy('March 01 2020')
mdy('Mars 01 2020', locale='French')
Sys.setlocale("LC_ALL", "French") %>% strsplit(";")


as.Date('Mars 01 2020', format='%B %d %Y')
as.Date('March 01 2020', format='%B %d %Y')
mdy('March 01 2020')
mdy('Mars 01 2020')


Sys.setlocale("LC_ALL", "Korean") %>% strsplit(";")
mdy('Mars 01 2020', locale='French_France.1252')
mdy('Mars 01 2020', locale='fr_FR.utf8')

wday(today(), label = TRUE, abbr = FALSE, locale = "German")
wday(today(), label = TRUE, abbr = FALSE, locale = "French")
month(today(), label = TRUE, abbr = FALSE, locale = "German")
month(today(), label = TRUE, abbr = FALSE, locale = "French")


Sys.setlocale("LC_ALL", "English") %>% strsplit(";")
# ubuntu라면 터미널에서 locale -a | grep en 으로 가능한 locale을 확인할 수 있다.
# Sys.setlocale("LC_ALL", "en_US.utf8") %>% strsplit(";")
as.POSIXct('March 01 2020 11:13:22', format='%B %d %Y %H:%M:%S')
strptime('March 01 2020 11:13:22', format='%B %d %Y %H:%M:%S')
mdy_hms('March 01 2020 11:13:22')
mdy_hms('March 01 2020 11:13:22', tz='Asia/Seoul')


Sys.setlocale("LC_ALL", "French") %>% strsplit(";")
as.POSIXct('Mars 01 2020 11:13:22', format='%B %d %Y %H:%M:%S')
strptime('Mars 01 2020 11:13:22', format='%B %d %Y %H:%M:%S')
mdy_hms('Mars 01 2020 11:13:22')
mdy_hms('Mars 01 2020 11:13:22', tz='Asia/Seoul')

Sys.setlocale("LC_ALL", "Korean") %>% strsplit(";")


## 6.5 날짜, 시간 연산

t0 <- Sys.time()
t1 <- as.POSIXct("2030-01-01 00:00:00")
t1-t0
difftime(t1, t0, units='weeks')
difftime(t1, t0, units='hours')


t0s <- format(t0, format="%Y-%m-%d %H:%S:%M")
t1s <- format(t1, format="%Y-%m-%d %H:%S:%M")
t1s-t0s
#Error in t1s - t0s : non-numeric argument to binary operator
difftime(t1s, t0s, units='weeks')
difftime(t1s, t0s, units='hours')


##6.6 날짜(시간)의 특정한 정보 참조

## 함수                       의미                              지역설정
## julian(x)                1970년 1월 1일 이후 몇번째의 일     "Korean"
## julian(x, origin = )     origin 이후 몇번째 일               "Korean"
## quartes(x)               분기(Q1, Q2, Q3, Q4)                "Korean"
## months(x)                월(1월, 2월, 3월, ...)              "Korean"
## months(x)                월(January, Februrary, March, ...)  "English"
## months(x, abbr = TRUE)   월(1, 2, 3, ...)                    "Korean"
## months(x, abbr = TRUE)```월(Jan, Feb, Mar, ...)              "English"
## weekdays(x)              요일(월요일, 화요일, 수요일,..)     "Korean"
## weekdays(x)              요일(Monday, Tuesday, Wednesday, ...)"English"
## weekdays(x, abbr =TRUE)  요일(월, 화, 수, ...)               "Korean"
## weekdays(x, abbr =TRUE)  요일(Mon, Tue, Wed,...)             "English"


## 6.7 날짜(시간) 갱신

## 함수     의미              
## year()   년
## month()  월
## week()   주
## yday()   (년 중) 일(1-366)
## mday()   (월 중) 일(1-31)
## day()    (월 중) 일
## yday()   (주 중) 일(1-7, 1:일)
## hour()   시
## minute() 분
## second() 초
## tz()     타임존
## dst()    써머타임(Daylight Saving Time)의 여부


t <- Sys.time()
t
year(t); year(t) <- 2030; t
month(t); month(t) <- 1; t
week(t); week(t) <- 2; t
day(t); day(t) <- 2; t


yday(t); yday(t) <- 1; t
yday(t); yday(t) <- 366; t
mday(t); mday(t) <- 2; t # same as day(t)
wday(t); wday(t) <- 3; t
wday(t, label=TRUE); wday(t); 
wday(t) <- 1; t 


hour(t); hour(t) <- 12; t
minute(t); minute(t) <- 41; t
second(t); second(t) <- 12; t
tz(t) ; tz(t) <- "GMT"; t
dst(t)
dst(t) <- TRUE
t

#library(parsedate)
format(as.Date(parse_iso_8601('2020-W53-6')), "%A")

options('lubridate.week.start'=1) 

wday(as.Date(parse_iso_8601('2020-W53-6'))) 

options('lubridate.week.start'=2) 

wday(as.Date(parse_iso_8601('2020-W53-6')))


t <- Sys.time()
t
tz(t) <- "GMT" # 또는 force_tz(t, tzone="GMT")
t
with_tz(t, "Asia/Seoul")


## 6.8 활용 예

t0 <- as.POSIXct("2021-01-01 13:00:00", tz='Europe/Paris'); t0
t1 <- t0; tz(t1) <- "Asia/Seoul"; t1
t2 <- with_tz(t1, tzone='Europe/Paris'); t2
t3 <- t2; hour(t3) <- hour(t3) + 7; t3
t4 <- with_tz(t3, tzone='Asia/Seoul'); t4


print(t1)
print(t2)
t1 == t2

