## 8 R로 데이터 읽어오기
 
## 8.0.1 주요 내용

install.packages('AER')
library('AER')

# R 내장 데이터 : data()
# 기본적인 방법 : read.table/write.table,load/save
# 텍스트로 저장된 화일 읽어오기
# -read.csv
# -빅데이터: data.table::fread,readr::read_csv
# 엑셀화일: readxl::read_excel
# 웹에서 긁어오기: htmltab, readHTMLTable

## 8.1 R 내장 데이터

data(mtcars)
head(mtcars, n=3)

data("BankWages", package='AER')
head(BankWages, n=3)

## 8.2 들어가기 : write.table/read.table, save/load

dat <- mtcars
head(dat, n=3)
class(dat)

write.table(dat, file='dat.txt')
dat02 <- read.table(file='dat.txt')

all.equal(dat, dat02)


dat <- mtcars

save(dat, file='dat.RData')
datBackup <- dat
rm(dat)
head(dat)
# Error in head(dat) : object 'dat' not found

load(file='dat.RData')

head(dat, n=3)
all.equal(dat, datBackup)
file.size('dat.txt')
file.size('dat.RData')
# ubuntu에서는 3835(아마도 데이터가 크지 않아서) vs 1780

object.size(dat)

## 8.3 텍스트로 저장된 데이터 화일 읽기

## 8.3.1 직접 텍스트 데이터 화일을 작성해 보기

datMsg <- 
  data.frame(
    name = c("BTS", "트와이스", "케이티 킴"),
    phone = c('010-4342-5842', '010-5821-4433', '010-5532-4432'),
    usageLastMonth = c(38000, 58000,31000),
    message = c('안녕, 날씨 좋다! "가즈아!"라고 말하고 싶다.',
                '달빛 아래 춤추자! \'너무너무너무\'라고 노래 부를래.',
                'Memorable'),
    price = c(30, 10, NA), 
    stringsAsFactors=FALSE)
datMsg

## 8.3.2 확장자 csv

write.csv(datMsg, file='dat.csv')
datMsg02 <- read.csv(file='dat.csv')
all.equal(datMsg, datMsg02)

head(datMsg02, 3)

datMsg03 <- 
  read.csv(file='dat.csv', row.names=1, stringsAsFactors=FALSE)
all.equal(datMsg, datMsg03)


## 8.3.3 텍스트 데이터 화일을 불러읽기

# 1. 텍스트 인코딩
#   readr::guess_encoding 을 통해 유추 가능. 하지만 확실치 않음
#
#   notepad++^3 등의 문서작성 프로그램을 활용하여 인코딩을 확인할 수도 있다.
#   특히 UTF-8BOM과 UTF-8의 구분은 readr::guess_encoding()에서는 불가능 하지만 notepad++에서는 가능
#
# 2. 전체적인 형식: 아래에서 c(,) 로 묶인 원소 중 하나를 선택해야 한다.
#   예) header=TRUE 또는 header = FALSE
#   
#   행이름을 포함하는가? header=c(TRUE,FALSE)
#   열이름을 포함하는가? row.names = c(1,NULL)
#   열 구분자(delimiter) sep=c('\t',',','')
#
# 3.데이터를 표기하는 방법
#   주석은 어떻게 구분하는가? comment.char =
#   따옴표(quotation mark; 문자열 속에 열 구분자를 포함시켜야 할 경우를 생각해보자): quote=
#   소수점 표기 방법(decimal seperator): dec=(나라마다 소수점 표기방법이 다르다.)
#
# 4.그밖에
#   stringsAsFactors = c(TRUE,FALSE)

# 파일 불러오는 경우 디렉토리 getwd()를 통해 확인해야함

# dat01 <- read.csv('Seoul_Hangang_Tourist_2009_2013.csv', fileEncoding = 'UTF-8')
# dat01 <- read.csv('서울시 한강공원 이용객 현황 (2009_2013년).csv', fileEncoding = 'UTF-8')

#dat01 <- read.csv('Seoul_Hangang_Tourist_2009_2013.csv', header = TRUE)
dat01 <- read.csv('서울시 한강공원 이용객 현황 (2009_2013년).csv', fileEncoding = 'UTF-8')
# windows에서는 에러. ubuntu에서는 정상적으로 읽어들임. 
dat02 <- read.csv('서울특별시 공공자전거 대여소별 이용정보(월간)_2017_1_12.csv', 
                  fileEncoding = 'cp949', quote="'") # unbuntu
dat02 <- read.csv('서울특별시 공공자전거 대여소별 이용정보(월간)_2017_1_12.csv',
                  quote="'")
# windows에서는 정상 작동. 
# ubuntu에서는,
#   Error in make.names(col.names, unique = TRUE) : 
#   invalid multibyte string at '<b4>뿩<c0><cf><c0><da>'
dat02 <- read.csv('서울특별시 공공자전거 대여소별 이용정보(월간)_2017_1_12.csv',
                  quote="'",
                  fileEncoding = 'EUC-KR') # ubuntu에서 정상 작동

dat03 <- read.csv('http://www.nber.org/data/population-birthplace-diversity/JoEG_BP_diversity_data.csv')
head(dat03, n=3)

## 8.3.5 윈도우에서 인코딩 문제

dat1 <- read.table('UTF-8test.txt', 
                   sep=',',
                   fileEncoding = 'UTF-8',
                   stringsAsFactors = FALSE); dat1

dat2 <- readr::read_delim('UTF-8test.txt',
                          delim = ',',
                          col_names = FALSE); dat2

dat3 <- data.table::fread('UTF-8test.txt', 
                          sep = ',',
                          header = FALSE,
                          encoding = 'UTF-8'); dat3

dat1 <- read.table('UTF-8test.txt', sep = ',', 
                   fileEncoding = 'UTF-8',
                   stringsAsFactors = FALSE)
dat1 ## ubuntu에서는 문제 없음

dat2 <- readr::read_delim('UTF-8test.txt', 
                          delim = ',',
                          col_names = FALSE)
dat2

dat3 <- data.table::fread('UTF-8test.txt',
                          sep = ',',
                          header = FALSE,
                          encoding = 'UTF-8'); dat3

dat1$V1 # ubuntu에서는 정상 작동
dat3$V1

dat3df <- as.data.frame(dat3); dat3tb <- tibble::as_tibble(dat3)
print(dat3df)
print(dat3df$V1)

## 8.4 EXCEL 화일 읽기

# install.packages("xlsx")

# ubuntu>
# sudo apt update -y
# sudo apt install -y openjdk-8-jdk openjdk-8-jre
# sudo R CMD javareconf

# *** JAVA_HOME is not a valid path, ignoring
# Java interpreter : /usr/bin/java
# Java version     : 1.8.0_252
# Java home path   : /usr/lib/jvm/java-8-openjdk-amd64/jre
# Java compiler    : /usr/bin/javac
# Java headers gen.: /usr/bin/javah
# Java archive tool: /usr/bin/jar

# trying to compile and link a JNI program 
# detected JNI cpp flags    : -I$(JAVA_HOME)/../include -I$(JAVA_HOME)/../include/linux
# detected JNI linker flags : -L$(JAVA_HOME)/lib/amd64/server -ljvm
# gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG -I/usr/lib/jvm/java-8-openjdk-amd64/jre/../include -I/usr/lib/jvm/java-8-openjdk-amd64/jre/../include/linux    -fpic  -g -O2 -fdebug-prefix-map=/home/jranke/git/r-backports/stretch/r-base-3.6.3=. -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c conftest.c -o conftest.o
# gcc -std=gnu99 -shared -L/usr/lib/R/lib -Wl,-z,relro -o conftest.so conftest.o -L/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server -ljvm -L/usr/lib/R/lib -lR
#
#
# JAVA_HOME        : /usr/lib/jvm/java-8-openjdk-amd64/jre
# Java library path: $(JAVA_HOME)/lib/amd64/server
# JNI cpp flags    : -I$(JAVA_HOME)/../include -I$(JAVA_HOME)/../include/linux
# JNI linker flags : -L$(JAVA_HOME)/lib/amd64/server -ljvm
# Updating Java configuration in /usr/lib/R
# Done. 


#install.packages("rJava")
#java libs   : '-L/usr/lib/jvm/default-java/jre/lib/amd64/server -ljvm'
#checking whether Java run-time works... ./configure: line 3796: /usr/lib/jvm/default-java/jre/bin/java: No such file or directory
#no
#configure: error: Java interpreter '/usr/lib/jvm/default-java/jre/bin/java' does not work
#ERROR: configuration failed for package ‘rJava’
#* removing ‘/home/master/R/x86_64-pc-linux-gnu-library/3.6/rJava’
#Warning in install.packages :
#  installation of package ‘rJava’ had non-zero exit status
#
require(rJava) # ubuntu와 windows에서 java 설치 방법???
#Loading required package: rJava
#Error: package or namespace load failed for ‘rJava’:
#  .onLoad failed in loadNamespace() for 'rJava', details:
#  call: dyn.load(file, DLLpath = DLLpath, ...)
#error: unable to load shared object '/home/master/R/x86_64-pc-linux-gnu-library/3.6/rJava/libs/rJava.so':
#  libjvm.so: cannot open shared object file: No such file or directory


# rJava 설치 on ubuntu
# https://wikidocs.net/52630


#install.packages('xlsx')

## 8.4 EXCEL 화일 읽기

# readxl::excel_sheets(path= )
# readxl::read_excel(path= , sheet= )

library(readxl)
readxl::read_excel('서울시 한강공원 이용객 현황 (2009_2013년).xls', sheet=1)
#Error(Ubuntu): 
#  filepath: 서울시 한강공원 이용객 현황 (2009_2013년).xls
#  libxls error: Unable to open file
readxl::read_xlsx('서울시 한강공원 이용객 현황 (2009_2013년).xls', sheet=1)

# 8.4.1

library(readxl)

rm(list=ls())

fn = "excel_example.xls"
vSh <- excel_sheets(fn)

#li <- vector(mode="list", length=length(vSh)-1)
if ( length(vSh) > 0 ) {
  for (iSh in 1:(length(vSh))) {
    vname <- vSh[iSh]
    if (exists(vname)) {
      cat('\b\b변수 ', vname, '이(가) 이미 존재합니다.\n')
      break
    }
    assign(vname, read_excel(fn, sheet=vSh[iSh]))
  }
} else {
  cat('No Sheet!!!\n')
}

vSh


ls()

# 8.5

install.packages('foreign')
install.packages('haven')


# 기본값이 없는 인수에 대한 오류

library(foreign)
#read.spss() # SPSS
#read.dta() # Stata
#read.ssd() # SAS
#read.octave() # Octave
#read.mtp() # Minitab
#read.systat() # Systat


library(haven)
#read_dta() # Stata
#read_por() # SPSS .por
#read_sas() # SAS
#read_sav() # SPSS .sav, .zsav
#read_stata() # Stata
#read_xpt() # SAS transport files


url = 
  'http://www.nber.org/data/population-birthplace-diversity/JoEG_BP_diversity_data.dta'

# 8.5.1
# 8.5.2

#install.packages('htmltab')
library(htmltab)

url <-
  "https://en.wikipedia.org/wiki/List_of_most_common_surnames_in_Europe"
surnames <- htmltab(doc = url, which = 13)
head(surnames, n=10)

#install.packages('XML')
#install.packages("RCurl")
#install.packages("rlist")

library(XML)
library(RCurl) 
library(rlist)


url <-
  "https://en.wikipedia.org/wiki/List_of_most_common_surnames_in_Europe"
theurl <- getURL(url, .opts = list(ssl.verifypeer = FALSE) )
# Windows에서 다음과 같은 에러가 발생(ubuntu는 정상작동)
# error:1407742E:SSL routines:SSL23_GET_SERVER_HELLO:tlsv1 alert protocol version
# RCurl은 더 이상 관리되지 않는다고 함.
#https://stackoverflow.com/questions/31504983/rcurl-geturl-ssl-error
library(curl)
con <- curl(url)
html <- readLines(con)

df <- readHTMLTable(html, header = TRUE, which = 13,
                    stringsAsFactors = FALSE, encoding = "UTF-8")
head(df, n=10)


