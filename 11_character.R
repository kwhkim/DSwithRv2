#Sys.setlocale("LC_ALL", "Korean")
library(stringi)
library(stringr)


x <- '한글사랑'
Encoding(x) 
Encoding(x) <- 'UTF-8'; x; Encoding(x)
Encoding(x) <- 'latin1'; x; Encoding(x)
Encoding(x) <- ''; x; Encoding(x)
Encoding(x) <- 'CP949'; x; Encoding(x)

x <- 'English'
Encoding(x) 
Encoding(x) <- 'UTF-8'; x; Encoding(x)
Encoding(x) <- 'latin1'; x; Encoding(x)
Encoding(x) <- 'CP949'; x; Encoding(x)


Sys.getlocale('LC_CTYPE')


scan(what="", sep='\n', quote='')
영어 한글 \\ "How can you", I thought 'Hmmm"\\'

#Read 1 item
#[1] "영어 한글 \\\\ \"How can you\", I thought 'Hmmm\"\\\\'"

scan(what="", sep='\n', quote='') # 윈도우 R의 경우 û, é가 제대로 입력되지 않는다.
불어 brûlée 한자 鬼 \ 와 ", '

#Read 1 item
#[1] "불어 brulee 한자 鬼 \\ 와 \", '"


Sys.setlocale('LC_CTYPE', 'English_United States.1252')
# ubuntu에서는
# Sys.setlocale('LC_CTYPE', 'en_US.utf8')

Sys.setlocale('LC_COLLATE', 'Korean_Korea.949')
# ubuntu에서는 Sys.setlocale('LC_COLLATE', 'ko_KR.utf8')



Sys.getlocale('LC_COLLATE')
x <- c("ä", "A", "D", "P", "Z", "CH", "C", "H", "Ü")
x <- stringi::stri_trans_nfkc(x)
cat(paste0(x, collpase=" "), "\n")
sort(x)



stri_sort(x, opts_collator = stri_opts_collator(locale='de'))
stri_sort(x, opts_collator = stri_opts_collator(locale='fi'))
stri_sort(x, opts_collator = stri_opts_collator(locale='en'))
stri_sort(x, opts_collator = stri_opts_collator(locale='cs'))
stri_sort(x, opts_collator = stri_opts_collator(locale='ko'))


Sys.setlocale('LC_ALL', 'Korean')


# 알파벳 15번째 소문자와 대문자는?
c(letters[15], LETTERS[15])


str <- "BoYs, Be aMbiTioUS!"
tolower(str)
toupper(str)
str_to_title(str)


str <- c("  Books", "Coffee\t", "Co ff ee", "\tBook", "I   like coffee.")
s1 <- trimws(str); s1
s2 <- trimws(str, which='left'); s2
s3 <- trimws(str, which='right'); s3
s4 <- stringr::str_squish(str); s4


table(s1)
table(s2)
table(s3)
table(s4)


paste0('I have ', 'a car')
paste0(c('I have ', 'I want '), c('a car', 'a cake'))


paste(c('ab', 'cd'), c('cd', 'ab'))
paste(c('ab', 'cd'), c('cd', 'ab'), sep='__')


paste(c('ab', 'cd'), c('ef', 'gh'), collapse='**')
paste(c('ab', 'cd'), c('ef', 'gh'), sep='__', collapse='')
paste(c('ab', 'cd'), c('ef', 'gh'), sep='__', collapse=NULL)


x1 <- c(0, -1, exp(1), -pi*10, exp(1)*1e+6)
x2 <- c(0, 1, 314, 9923, -1123224)
x3 <- c(0, 314.413, pi*100, -1123224*0.123)
print(x1); print(x2); print(x3)

sprintf("%6.2f", x1); sprintf("%6.2f", x2); sprintf("%6.2f", x3);


x1 <- "  3.14"; x2 <- "3.14  "

sprintf(c("%10.2f", "%010.2f", "%+10.2f", "%+010.2f"), pi) # 우측 정렬
sprintf(c("%-10.2f", "%-+10.2f"), pi) # 좌측 정렬
sprintf(c("%10.2f", "%+10.2f"), pi*1000000) # 좌측 정렬


x <- c("abcdefg", "hijklmnop")
substring(x, 1, 4)
substring(x, 1, 4) <- c("aaaa", "bbbb"); x


library(stringr)
patt = 'xxxx'
str = c("I don't know", "How the xxxx do I know?", "Wow, x is 5!",
        "xxxx xxxx xxxx", "Don't say xxxx to me, xxxx.")
str_detect(str, pattern = fixed(patt))


str_count(str, pattern = fixed(patt))
str_split(str, pattern = fixed(patt))
str_locate(str, pattern = fixed(patt))
str_replace(str, pattern = fixed(patt), replacement='yyyy')



