# 제 15장. 간편 시각화
# 15.1 간편 시각화의 예
# 15.1.1 일변수 분포
library(dplyr)
library(ggplot2)
library(lattice)
data('BankWages', package='AER')
data(mtcars)
hist(BankWages$education) # 연속형 변수
plot( ~ gender, data=BankWages) # 이산형 변수


# 15.1.2 이변수 플롯
# 데이터 준비 : 범주 비율이 차이를 두기 위해서
Bank1 <- BankWages %>% slice(1:200) %>% filter(gender == 'male')
Bank2 <- BankWages %>% slice(-(1:200))
Bank <- rbind(Bank1, Bank2)

# 이변수 그림 : x=이산형, y=이산형
plot(job ~ gender, data=Bank)
# 이변수 그림 : x=이산형, y=연속형
plot(education ~ gender, data=Bank)
# 이변수 그림 : x=연속형, y=연속형
plot(qsec ~ hp, mtcars)


# 15.1.3 조건부 일변수 분포
histogram( ~ job | gender, BankWages)
histogram( ~ job | gender * minority, BankWages)

# 15.1.4 조건부 이변수 플롯
# 조건부 이변수 그림 : x=범주형, y=연속형
xyplot(education ~ job | gender, BankWages)
xyplot(education ~ job | gender, BankWages, jitter.x=TRUE)

# 15.1.5 조건부 이변수 플롯
# 조건부 이변수 그림 : x=연속형, y=연속형
xyplot(qsec ~ hp | mpg, mtcars)
mpgequal <- equal.count(mtcars$mpg, number=3, overlap=0)
xyplot(qsec ~ hp | mpgequal, mtcars)

mpgequal <- equal.count(mtcars$mpg, number=5, overlap=0)
xyplot(qsec ~ hp | mpgequal, mtcars)

mpgequal <- equal.count(mtcars$mpg, number=5, overlap=0.2)
xyplot(qsec ~ hp | mpgequal, mtcars)

