# DT1[DT2, on='key'][, .SD[1], by='key']
# DT1[DT2, on='key', mult='first']
# 위의 둘은 항상 같지 않다!

# DT1[DT2, on='key'][, .SD[.N], by='key']
# DT1[DT2, on='key', mult='last']
# 책의 내용과 다르게 위의 둘은 항상 같지 않다!

# 위의 내용에 대한 부연 설명
library(data.table)

DT1 = data.table(a = c(1,1,2,2,3,4,5),
                 b = c(10,11,20,21,30,30,40))
DT2 = data.table(a = c(1,2,3,3,4,4,5),
                 c = c(10,21,30,30,41,42,50))
DT2[DT1, on ='a']
DT2[DT1, on ='a', mult='first'] 
# DT2에서 DT1$a를 찾아서 첫 번째 행을 DT1과 합친다.
DT2[DT1, on ='a'][, .SD[1], by='a']
# DT2과 DT1을 컬럼 'a'를 기준으로 병합한 후, 컬럼 'a'의 값별로 하나의 행만 남긴다.


