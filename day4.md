# title

- author: 이윤석
- date: 2021년 봄학기
- revision: v0.9
- compile:  > knit("day4.Rmd", output = "day4.md")



```r
> (ver <- Sys.time() )
```

```
## [1] "2021-05-16 09:45:30 KST"
```

## 데이터프레임 만들기/부르기

지금까지 다룬 R의 기본 기능과 알고리듬 연습에서는 그때마다 손으로 입력하거나 임의의 숫자를 발생하는 방법으로 필요한 데이터를 충당해서 썼다. 제3강의 수업 보충원고의 제목이 "데이터 없이 프로그래밍 하기"였던 이유도 거기에 있었지만 제4강에서는 데이터에 집중한 프로그래밍을 익히기 위해 데이터를 R에서 읽는 방법부터 소개하였다.

R이 다루는 데이터의 유형을 벡터, 매트릭스, 리스트 등으로 분류하였었는데 리스트의 한 세부 형태로서 격자형으로 정형화된 "데이터프레임(data.frame)"이 교환의 표준으로 널리 인정된다. 실제로도 각종 패키지에 딸린 형태로, 그리고 연구자들이 교환하는 가장 흔한 형태가 데이터프레임이다. 우리말로 번역해서 "자료철"이라고 부르기도 하지만 이 용어에 대한 폭넓은 합의는 없다.

6명의 피험자에서 시험 약제 P를 투여하기 전과 후의 가상적인 측정값은 다음의 모양을 가졌다. 

| subject | beforeP | afterP |
|===|===|===|
| A | 4.3 | 5.7 | 
| B | 5.6 | 5.4 |
| C | 3.9 | 4.6 |
| D | 5.7 | 7.3 |
| E | 4.8 | 6.0 |
| F | 5.2 | 5.3 |
 
데이터프레임은 고정된 수의 행과 열을 가진 격자 모양의 데이터이므로 위의 표와 같은 모양을 가진 데이터를 보관하기에 적당하다.

### 콘솔/스크립트에서 키보드로

숫자 18개뿐이므로($6\times3$) 손으로도 즉시 입력할 수 있다. 입력하기 전에 데이터프레임의 이름을 정하고(`DrugP`로 한다) 각 열의 이름들(보이는 그대로 `subject, beforeP, afterP`)을 정한다. 정확히 입력한 뒤 괄호의 수효를 맞추어 닫고 엔터키를 누르면 `DrugP`가 생성되지만 아무런 알림 없이 커서를 되돌리므로(에러가 있다면 무언가 보일 것이지만) 프린트 명령을 통해서 확인할 수 있다.



```r
> DrugP <- data.frame( subject = c("A", "B", "C", "D", "E", "F"),
+ 	beforeP = c(4.3, 5.6, 3.9, 5.7, 4.8, 5.2),
+ 	afterP = c(5.7, 5.4, 4.6, 7.3, 6.0, 5.3))
> print(DrugP)
```

```
##   subject beforeP afterP
## 1       A     4.3    5.7
## 2       B     5.6    5.4
## 3       C     3.9    4.6
## 4       D     5.7    7.3
## 5       E     4.8    6.0
## 6       F     5.2    5.3
```

```r
> class(DrugP)
```

```
## [1] "data.frame"
```

맨 왼쪽에 열거된 1부터 6까지의 수치는 데이터프레임의 일부가 아니라 데이터프레임을 출력할 때 R이 붙이는 행 번호이다. `DrugP` 데이터프레임은 세 개의 변수를 가지는데, 각 변수 하나가(variable) 논리적으로 하나의 열을(column) 이루며, 동시에 하나의 변수는 하나의 벡터이다. 각 행을(row) 한 행으로도 부르지만 한 레코드(record)라고도 부른다. 따라서 한 열을 차지하는 데이터는 숫자이든, 논리값이든, 문자열이든 동일한 자료형(data type)이어야 하며, 한 행을 차지하는 데이터, 즉 레코드는 상이한 형으로 구성되는 것이 가능하다. 데이터프레임의 특정 행 번호와 열 번호로 내용을 추출할 때 매트릭스 때와 동일한 인덱싱 방법을 쓰면 되며,


```r
> DrugP[3:4, 2:3] # row no. 3-4 and column no. 2-3
```

```
##   beforeP afterP
## 3     3.9    4.6
## 4     5.7    7.3
```

데이터프레임은 동일한 길이를 가진 벡터들을 담고 있는 리스트와 본질적으로 동일하므로, 리스트의 컨텐츠를 추출할 때 썼던 `$` 연산자를 쓰면 변수 단위로도 추출할 수도 있다. 어쩌면 이 방식을 쓸 일이 더 많을 것이다. 데이터프레임에서는 변수가 열을 이루지만 추출하고 나면 벡터일 뿐이므로 방향의 차원을 상실한 채 옆으로 출력될 것이다.


```r
> DrugP$beforeP
```

```
## [1] 4.3 5.6 3.9 5.7 4.8 5.2
```

```r
> length(DrugP$beforeP) 
```

```
## [1] 6
```

```r
> length(DrugP$subject) # same lengths
```

```
## [1] 6
```

```r
> DrugP[, "beforeP"]
```

```
## [1] 4.3 5.6 3.9 5.7 4.8 5.2
```

데이터프레임에서 변수를 추출하는 위의 두 방식은 동일한 결과를 낸다. 데이터프레임의 구조를 들여다보는 함수는 `str()`이다.


```r
> str(DrugP)
```

```
## 'data.frame':	6 obs. of  3 variables:
##  $ subject: Factor w/ 6 levels "A","B","C","D",..: 1 2 3 4 5 6
##  $ beforeP: num  4.3 5.6 3.9 5.7 4.8 5.2
##  $ afterP : num  5.7 5.4 4.6 7.3 6 5.3
```

### CSV, TSV 파일로부터

csv 파일은 쉼표로 구분된 값들을 가진(comma-seperated values) 텍스트 파일이고 tsv 파일은 탭으로 구분된 값들을 가진(tab-separated values) 텍스트 파일이다. 이 두 형식의 데이터 보관 파일은 사실상 학계에서 데이터의 표준 교환 형식으로 간주하며 csv와 tsv가 무엇인지 설명 없이 처음부터 약어로 쓰는 경우가 빈번하므로 학생들도 알아 두는 것이 좋겠다. csv 파일은 공통적으로 `.CSV`의 확장자를 가진 경우가 많은 반면에 tsv 파일은 약속된 확장자 없이 .`TXT, .DOC, .DAT, .TSV` 등이 구분 없이 혼용되는 경향이 보이므로 `.TSV` 확장자가 아닌 경우에는 열어보는  것 외에는 내용을 알 수 있는 방법이 없다. 이 원고에서는 csv 파일만 취급하겠지만 tsv 파일도 같은 방식으로 다룰 수 있다.

csv, tsv 파일을 모두 읽을 수 있는 R 함수는 `read.table()`이다. `sep = ` 인수에 쉼표(`,` )나 탭(`\t`)을 넣어서 읽을 파일의 특성을 지정한다. 수업 github의 폴더에서 `plasma.csv` 파일을 찾아서 현재 작업 디렉터리로 다운로드를 한다. 그리고 R에서 다음처럼 명령을 내리면 8행, 2열짜리  `Plasma` 데이터프레임이 생성될 것이다. 


```r
> ( Plasma <- read.table("plasma.csv", sep = ",", header = TRUE) )
```

```
##   normovolemia hypovolemia
## 1           77          72
## 2           91          62
## 3          101          51
## 4           81          81
## 5           76          47
## 6           68          74
## 7           72          52
## 8           82          65
```

```r
> str(Plasma)
```

```
## 'data.frame':	8 obs. of  2 variables:
##  $ normovolemia: int  77 91 101 81 76 68 72 82
##  $ hypovolemia : int  72 62 51 81 47 74 52 65
```

R의 read.table() 함수는 데이터가 반드시 로컬 컴퓨터에 존재하지 않아도 작동한다. 인터넷 상의 유효한 주소를 가졌다면 그대로 써 넣어서 데이터를 불러올 수 있다. 다음은 1979년 독일에서 조사된 자살 관련 자료이며 Vincent Arel-Bundock이라는 이름의 github에서 제공하고 있다.


```r
> Suicide <- read.table("https://vincentarelbundock.github.io/Rdatasets/csv/vcd/Suicide.csv", sep = ",", header = TRUE) #
> str(Suicide)
```

```
## 'data.frame':	306 obs. of  7 variables:
##  $ X        : int  1 2 3 4 5 6 7 8 9 10 ...
##  $ Freq     : int  4 0 0 247 1 17 1 6 0 348 ...
##  $ sex      : Factor w/ 2 levels "female","male": 2 2 2 2 2 2 2 2 2 2 ...
##  $ method   : Factor w/ 9 levels "cookgas","drown",..: 8 1 9 4 2 3 6 5 7 8 ...
##  $ age      : int  10 10 10 10 10 10 10 10 10 15 ...
##  $ age.group: Factor w/ 5 levels "10-20","25-35",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ method2  : Factor w/ 8 levels "drown","gas",..: 8 2 2 4 1 3 6 5 7 8 ...
```

`read.table(... sep = ",")` 함수는 간단히 `read.csv()`로 대체해서 사용하면 편리하다.


```r
> Fitbit <- read.csv("https://query.data.world/s/tmfnjifil7xquwszyd5quz3ltrml4l", header=TRUE) #
```


### R이 가지고 있는 데이터로부터

프로그래밍 언어로서보다 자료 분석용으로 R을 공부할 때 흔히 장점으로 거론되는 내용이 기본으로 가지고 있는 예제 데이터가 풍성하다는 것이다. 이 수업에서 연습 삼아 불러올 데이터프레임은 `ChickWeight`이다. "불러온다"라고 표현했지만 실은 R 내부에 이미 장착되어 있다. 먼저 도움말 페이지를 열어 보자.

`
?ChickWeight
ChickWeight              package:datasets              R Documentation

Weight versus age of chicks on different diets

Description:

     The ‘ChickWeight’ data frame has 578 rows and 4 columns from an
     experiment on the effect of diet on early growth of chicks.

Usage:

     ChickWeight
     
Format:

     An object of class ‘c("nfnGroupedData", "nfGroupedData",
     "groupedData", "data.frame")’ containing the following columns:

     weight a numeric vector giving the body weight of the chick (gm).

     Time a numeric vector giving the number of days since birth when
          the measurement was made.

     Chick an ordered factor with levels ‘18’ < ... < ‘48’ giving a
          unique identifier for the chick.  The ordering of the le
`

퍼뜩 눈에 보이는 부분은 이 자료철이 578행과 4열을 가지고 있다는 점이고 병아리의 성장에 미치는 식이의 효과를 측정한 자료라는 점이다. 도움말 페이지를 더 읽을 수도 있고 바로 데이터프레임의 구조를 확인해도 좋겠다.


```r
> str(ChickWeight)
```

```
## Classes 'nfnGroupedData', 'nfGroupedData', 'groupedData' and 'data.frame':	578 obs. of  4 variables:
##  $ weight: num  42 51 59 64 76 93 106 125 149 171 ...
##  $ Time  : num  0 2 4 6 8 10 12 14 16 18 ...
##  $ Chick : Ord.factor w/ 50 levels "18"<"16"<"15"<..: 15 15 15 15 15 15 15 15 15 15 ...
##  $ Diet  : Factor w/ 4 levels "1","2","3","4": 1 1 1 1 1 1 1 1 1 1 ...
##  - attr(*, "formula")=Class 'formula'  language weight ~ Time | Chick
##   .. ..- attr(*, ".Environment")=<environment: R_EmptyEnv> 
##  - attr(*, "outer")=Class 'formula'  language ~Diet
##   .. ..- attr(*, ".Environment")=<environment: R_EmptyEnv> 
##  - attr(*, "labels")=List of 2
##   ..$ x: chr "Time"
##   ..$ y: chr "Body weight"
##  - attr(*, "units")=List of 2
##   ..$ x: chr "(days)"
##   ..$ y: chr "(gm)"
```

변수의 이름만 출력된 게 아니라 여러 속성까지 보여서 다소 복잡해 보이지만 현시점에서는 무시하고 리스트 변수의 이름과 데이터 유형만 관심을 가져 보았다. 첫 변수는 weight로서 숫자형, 두 번째는 Time으로서 숫자형, Chick 변수는 순서가 있는 요인형으로서 총 50레벨을 가졌고 마지막의 Diet 변수는 숫자처럼 보이지만 "1", "2", "3", "4"의 레벨을 가지는 요인형이다. 긴 데이터프레임을 한 번에 출력하는 것은 낭비이므로 앞이나 뒤에서부터 일정 분량의 행을 읽는 `head()` 및 `tail()` 함수가 있다.


```r
> head(ChickWeight, 5)
```

```
## Grouped Data: weight ~ Time | Chick
##   weight Time Chick Diet
## 1     42    0     1    1
## 2     51    2     1    1
## 3     59    4     1    1
## 4     64    6     1    1
## 5     76    8     1    1
```

```r
> tail(ChickWeight, 7)
```

```
## Grouped Data: weight ~ Time | Chick
##     weight Time Chick Diet
## 572    122   10    50    4
## 573    155   12    50    4
## 574    175   14    50    4
## 575    205   16    50    4
## 576    234   18    50    4
## 577    264   20    50    4
## 578    264   21    50    4
```

R이 내장하고 있는 데이터를 일람하기 위해서 사용빈도는 낮지만 `data()` 함수를 쓸 수 있으며, 패키지 단위로 출력하는 것이 바람직하다. R을 구동한 뒤로 사용자가 아무 추가 패키지도 탑재하지 않았어도 `utils,` `stats,` 그리고 `datasets` 패키지는 자동으로 메모리로 올라오므로 각 패키지에 귀속된 데이터를 따로 보려면 이렇게 한다. 제약된 지면 문제로 여기서는 결과를 출력하지 않았다.


```r
> data( package = "stats")
```

데이터가 귀속된 패키지의 이름이 R에서는 네임스페이스(namespace) 구실을 한다. 네임스페이스는 변수의 활동 범위를 제한함으로써 프로그래머가 의도하지 않았던 혼란을 막는 데 중요한 구실을 한다. 한 패키지를 메모리에 올리면 결국 그 네임스페이스가 활성화된다. 따라서 활성된 네임스페이스에 속한 데이터는 콘솔에 직접 데이터프레임의 이름을 입력함으로써 처리할 수 있다. 

### R의 자료, 그러나 다른 네임스페이스에 존재하는

활성화되지 않은 네임스페이스에 속한 데이터를 불러오려면 간단히 네임스페이스를 강제로 지정하면 된다. 패키지 `nlme`에 들어 있는 `Rails` 데이터프레임은 간단한 다음 한 줄로 불러올 수 있다.


```r
> nlme::Rail
```

```
## Grouped Data: travel ~ 1 | Rail
##    Rail travel
## 1     1     55
## 2     1     53
## 3     1     54
## 4     2     26
## 5     2     37
## 6     2     32
## 7     3     78
## 8     3     91
## 9     3     85
## 10    4     92
## 11    4    100
## 12    4     96
## 13    5     49
## 14    5     51
## 15    5     50
## 16    6     80
## 17    6     85
## 18    6     83
```

이중콜론 연산자(`a::b`)는 왼쪽 항에서 네임스페이스를 읽고 오른쪽 항에서 객체의 이름을 읽는다 (data.frame도 당연히 객체이다).  이 방식은 타자해야 할 문자의 숫자가 적어서 편한 반면에 데이터를 읽을 때마다 매번 네임스페이스를 지정하지 않으면 해당하는 객체를 찾지 못했다는 오류를 낳는다는 불편이 있다. 


```r
> str(Rail)
```

```
## Classes 'nffGroupedData', 'nfGroupedData', 'groupedData' and 'data.frame':	18 obs. of  2 variables:
##  $ Rail  : Ord.factor w/ 6 levels "2"<"5"<"1"<"6"<..: 3 3 3 1 1 1 5 5 5 6 ...
##  $ travel: num  55 53 54 26 37 32 78 91 85 92 ...
##  - attr(*, "labels")=List of 1
##   ..$ y: chr "Zero-force travel time"
##  - attr(*, "units")=List of 1
##   ..$ y: chr "(nanoseconds)"
##  - attr(*, "formula")=Class 'formula'  language travel ~ 1 | Rail
##   .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
##  - attr(*, "order.groups")= logi TRUE
```

이런 불편을 피하고자  최초에 한 번만 네임스페이스를 지정해서 데이터를 메모리에 올리는 방법이 있다.


```r
> data(Rail, package = "nlme")
> str(Rail)
```

```
## Classes 'nffGroupedData', 'nfGroupedData', 'groupedData' and 'data.frame':	18 obs. of  2 variables:
##  $ Rail  : Ord.factor w/ 6 levels "2"<"5"<"1"<"6"<..: 3 3 3 1 1 1 5 5 5 6 ...
##  $ travel: num  55 53 54 26 37 32 78 91 85 92 ...
##  - attr(*, "labels")=List of 1
##   ..$ y: chr "Zero-force travel time"
##  - attr(*, "units")=List of 1
##   ..$ y: chr "(nanoseconds)"
##  - attr(*, "formula")=Class 'formula'  language travel ~ 1 | Rail
##   .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
##  - attr(*, "order.groups")= logi TRUE
```

`data(... , package = "...")`로 쓴 위의 방법은 직관적으로 앞에서 소개했던 이중콜론 연산자로 불러온 데이터를 새 변수에 옮겨서 보관하는 다음의 한 줄과 완전히 동일한 구실을 할 것이다.


```r
> ergoStool <- nlme::ergoStool
> head(ergoStool, 4)
```

```
## Grouped Data: effort ~ Type | Subject
##   effort Type Subject
## 1     12   T1       1
## 2     15   T2       1
## 3     12   T3       1
## 4     10   T4       1
```



## Closing


```r
> Sys.time() - ver
```

```
## Time difference of 3.10032 secs
```

