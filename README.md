# R로 하는 빅데이터 분석(개정판) 

* github 주소 : [DSwithRv2](https://github.com/Sumeun/DSwithRv2)

* [**R로 하는 빅데이터 분석(개정판)**: 데이터 전처리와 시각화,개념적 기초에서 심층 활용까지](https://book.naver.com/bookdb/book_detail.nhn?bid=15970846)의 R 소스 코드.

* Windows와 ubuntu에서 실행 확인
  - 오류 수정


## 데이터 화일

* `dat.txt`, `dat.RData`, `dat.csv` : 임시 데이터 화일(R script 실행 시 생성됨)
* `서울시 한강공원 이용객 현황 (2009_2013년).xls`
* `서울시 한강공원 이용객 현황 (2009_2013년).csv`
* `서울특별시 공공자전거 대여소별 이용정보(월간)_2017_1_12.csv`
* `UTF-8test.txt`
* `excel_example.xls`

## 그밖의 임시 생성 화일

* `palette.RData`
* `picRecent.png`
* `picp.jpg`
* `flights.db`


----

![책소개](http://ds.sumeun.org/wp-content/uploads/2019/02/bigData2nd_ad02.png)

## 책 차례

* 서문 1

    - 1 들어가기 3
    - 1.1 R 

* [2 R의 패키지(Packages)](https://github.com/Sumeun/DSwithRv2/blob/main/02_Packages.R) 5
    - 2.1 패키지 설치 
    - 2.2 패키지 관련 정보 
    - 2.3 패키지 불러오기/확인하기/제거하기 
    - 2.4 패키지 관리하기 
    - 2.5 중복되는 함수와 변수 

* [3 R의 변수, 자료형, 연산/함수](https://github.com/Sumeun/DSwithRv2/blob/main/03_Variables.R) 9
    - 3.1 R의 변수 
    - 3.2 R의 데이터 타입(자료형) 
    - 3.3 연산(Operations)과 함수(Functions) 
    - 3.4 특별한 값 

* [4 데이터 구조](https://github.com/Sumeun/DSwithRv2/blob/main/04_DataStructure.R) 25
    - 4.1 벡터(Vector) 
    - 4.2 행렬(matrix), 배열(array), 데이터프레임(data.frame), 리스트(list) 37
    - 4.3 행렬, 배열, 데이터프레임, 리스트의 부분선택하기 
    - 4.4 행렬, 배열, 데이터프레임, 리스트 수정하기 
    - 4.5 CRUD(Create, Read, Update, Delete) 
    - 4.6 3차 이상의 다차원 배열 

* [5 dplyr 패키지를 활용한 데이터 가공](https://github.com/Sumeun/DSwithRv2/blob/main/05_dplyr_edited.R) 57
    - 5.1 magrittr의 파이프 연산자 
    - 5.2 dplyr의 방식: 부분 선택(Subsetting) 
    - 5.3 dplyr의 방식 : 수정 
    - 5.4 dplyr의 기타 편의 기능 

* [6 날짜와 시간(Date and Time)](https://github.com/Sumeun/DSwithRv2/blob/main/06_DateTime_edited.R) 77
    - 6.1 R의 날짜와 시간 
    - 6.2 날짜의 표기 
    - 6.3 날짜 표기 변환 
    - 6.4 날짜시간 표기 인식 
    - 6.5 날짜, 시간 연산 
    - 6.6 날짜(시간)의 특정한 정보 참조 
    - 6.7 날짜(시간) 갱신 
    - 6.8 활용 예 

* [7 팩터 자료형](https://github.com/Sumeun/DSwithRv2/blob/main/07_Factor_edited.R) 91
    - 7.1 팩터형의 중요성 
    - 7.2 데이터 전처리에 있어서 팩터형 
    - 7.3 forcats 패키지 
    
* [8 R로 데이터 읽어오기](https://github.com/Sumeun/DSwithRv2/blob/main/08_ImportData_seolbin_edited.R) 97
    - 8.1 R 내장 데이터 
    - 8.2 들어가기 : write.table/read.table, save/load 
    - 8.3 텍스트로 저장된 데이터 화일 읽기 
    - 8.4 EXCEL 화일 읽기 
    - 8.5 그 밖의 통계 프로그램 데이터 화일 

* [9 데이터 가공](https://github.com/Sumeun/DSwithRv2/blob/main/09_DataManipulation.R) 109
    - 9.1 집단별로 함수 적용하기 
    - 9.2 여러 데이터 프레임 합치기 
    - 9.3 세로형/가로형 변환 
    
* [10 패키지 데이터테이블(data.table)](https://github.com/Sumeun/DSwithRv2/blob/main/10_DataTable_kwhkim.R) 129
    - 10.1 package:dplyr과 package:data.table의 비교 
    - 10.2 data.table의 키(key) 활용하기 
    - 10.3 data.table을 활용한 병합 
    - 10.4 그 밖의 특수한 기호 : .SD, .GRP, .N, .I, .BY, .EACHI, .
    - 10.5 데이터테이블 종합 

* [11 문자열(character)](https://github.com/Sumeun/DSwithRv2/blob/main/11_character.R) 167
    - 11.1 인코딩 
    - 11.2 대표적인 인코딩 방법 
    - 11.3 인코딩 방법의 종류 
    - 11.4 R에서 인코딩 다루기 
    - 11.5 R에서 문자열 입력 
    - 11.6 유니코드 정규화(Normalization) 
    - 11.7 문자열의 정렬 
    - 11.8 문자열을 다루는 함수들 
    - 11.9 패키지 stringr을 활용한 문자열 관리 

* [12 정규표현식](https://github.com/Sumeun/DSwithRv2/blob/main/12_RE.R) 185
    - 12.1 R과 정규표현식 
    - 12.2 확장정규표현식(ERE; Extended Regular Expressions) 
    - 12.3 Perl 호환 정규표현식 
    - 12.4 패키지 stringr, stringi 
    - 12.5 stringi 패키지와 정규표현식을 활용한 문자열 데이터 가공 

* [13 흐름 제어와 함수](https://github.com/Sumeun/DSwithRv2/blob/main/13_ControlFunc.R) 201
    - 13.1 제어문: 조건과 반복 
    - 13.2 함수 

* [14 기술 통계량](https://github.com/Sumeun/DSwithRv2/blob/main/14_DescStat.R) 215
    - 14.1 1변수 기술 통계량 
    - 14.2 데이터 프레임의 모든 변수(컬럼)에 대해 요약통계치 구하기 
    
* [15 간편 시각화](https://github.com/Sumeun/DSwithRv2/blob/main/15_plots.R) 221
    - 15.1 간편 시각화의 예 

* [16 ggplot2](https://github.com/Sumeun/DSwithRv2/blob/main/16_ggplot2_kwhkim.R) 227
    - 16.1 들어가기 
    - 16.2 시각적 맵핑(Aesthetic mapping) 
    - 16.3 기하학적 대상(geom) 
    - 16.4 보조선(Auxillary lines) 
    - 16.5 좌표계(Coordinate system) 
    - 16.6 Coordinate system 
    - 16.7 범례(Legends) 
    - 16.8 제목과 테마(Title and Theme) 
    - 16.9 결과 정리 및 저장 
    - 16.10ggplot2(gg = Grammar of Graphics) 총정리 

* [17 연습문제 해답](https://github.com/Sumeun/DSwithRv2/blob/main/17_Solutions.R) 279
    - 데이터 구조 
    - 데이터 불러들이기 
    - 제어와 함수 I
    
* [R에서 하는 벡터/행렬 연산](https://github.com/Sumeun/DSwithRv2/blob/main/18_Matrix.R) 283
    - 벡터연산 
    - 한 행렬 연산 
    - 두 행렬의 연산 
    - 선형(행렬) 대수 

* A 수 표기 방법 287
    - A.1 국제표준 ISO 80000-1 
    - A.2 한글 맞춤법 
    - A.3 다른 나라의 수 표기 
    - A.4 R에서 수 읽기 

* [B dplyr을 SQL로 번역하기](https://github.com/Sumeun/DSwithRv2/blob/main/A2_dplyrToSQL.R) 289
    - B.1 수기 번역 
    - B.2 dbplyr 패키지를 사용한 자동 번역 
    
* [C 화일과 디렉토리 관련 함수들](https://github.com/Sumeun/DSwithRv2/blob/main/A3_files_juri.R) 293
    - C.1 디렉토리 
    - C.2 스크립트 
    - C.3 화일 

* D R의 색, 세계 타임존 299

* E 치트시트 305
