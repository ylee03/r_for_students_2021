# R script (R 수업 둘째 날 수업 중 직접 입력해서 실행했던 R 코드)
# day2.R

#-----------------------------------------------------
# how to calculate body surface area using Mosteller's formula

ht <- 165
wt <- 80
bsa <- sqrt(ht * wt / 3600)


# Mosteller's formula as a user-defined function

bsa <- function(ht, wt) {
	result <- sqrt(ht * wt / 3600)
	return( result )
}
bsa(170, 80)
bsa(wt = 80, ht = 170)



#-----------------------------------------------------
# convert degrees to radians

from_Degree_to_Radian <- function(deg) {
	rad <- deg * pi / 180
	return(rad)
}

from_Degree_to_Radian(deg = 180)
from_Degree_to_Radian(180)

x <- seq(0, 360, 1)
x2 <- from_Degree_to_Radian(x)
y <- sin( x2 )

# plotting sine graph

plot(x, y, 
	type = "1", 
	xlab = "x (degree)", 
	ylab = "sin(x)")
	

#-----------------------------------------------------
# for loop

for (i in 1:10) {
	print(i * i)
}


hab <- 0
for (i in 1:1000) {
	hab <- hab + i
}
print(hab)


for (i in 1:50) {
	print("Hello")
}

for (i in 10:1) print("hello")
	
for (i in 10:1) print( paste("hello", i) )



#-----------------------------------------------------
# while loop

hab <- 0
i <- 1
while (i >= 1 & i <= 100) {
	
	hab <- hab + i
	i <- i + 1
	
}	


print(i) # 101
print(hab) # 5050




# infinite while-loop (having no valid exit condition)

hab <- 0
i <- 1
while (i >= 1 & i <= 100) {
	
	hab <- hab + i
	
}	


print(i) # 101
print(hab) # 5050



#-----------------------------------------------------
# github

# https://github.com/ylee03/r_for_students_2021/



#-----------------------------------------------------
#  1부터 자연수 n까지의 합을 구하는 간단한 함수 제작


# 1보다 작은 수가 입력되면 에러 발생

calcHab <- function(n) {
	
	if (n < 1 ) return("******error******")
		
	result <- 0
	for (i in 1:n) 
		result <- result + i
	
	return(result)
}

calcHab(n = 100)


# 부동소수점을 가진 숫자가 입력되면 역시 에러

calcHab_v2 <- function(n) {
	
	if ( n < 1 ) return("******error******")
	if (is.floatingpoint(n)) return("******floating number was entered *****")
		
	result <- 0
	for (i in 1:n) 
		result <- result + i
	
	return(result)
}



# 부동소수점을 가진 숫자를 찾는 함수

is.floatingpoint <- function(x) {
	
	x <- as.character(x)
	result <- grepl("[.]", x)
	return(result)
}


is.floatingpoint(23.4)
is.floatingpoint(23)


calcHab_v2(10)
calcHab_v2(-3)
calcHab_v2(5.7)


#-----------------------------------------------------
# dual for-loop

# sample 1

for (j in c("John", "Julie", "Mark", "Tom")) 
   for (i in 1:10) 
         print( paste("Hello", j, "#", i) )


# sample 2

b0 <- Sys.time()
s <- 0
for (j in 1:10^6)
	for (i in 1:100) s <- s + i
		
( Sys.time() - b0 )
print(s)



# loop-break
b0 <- Sys.time()
s <- 0
for (i in 1:100) s <- s + i	
s <- s * 10^6
( Sys.time() - b0 )
print(s)


# 내장 함수

b0 <- Sys.time()
s <- sum(1:100) # 합을 구하는 R의 base function
s <- s * 10^6
( Sys.time() - b0 )
print(s)


#-----------------------------------------------------
# 합을 구하는 함수 다시 제작

# 방법 1 (간단, 루프)

sum_w <- function(n) {
	result <- 0
	for (i in 1:n) result <- result + i
	return(result)
}

sum_w(10)
sum_w(1)


# 방법 2 (참신, 재귀)
sum_w2 <- function(n) {
	
	if (n == 1) return(1)
		
	result <- n + sum_w2(n - 1)
	return(result)

}

sum_w2(10)
sum_w2(100)


# 재귀 호출을(resursion) 동원해서 수학 연산 팩토리얼을 구현하는 R 함수

factorial_w <- function(n) {
	
	if (n == 1) return(1)
		
	result <- n * factorial_w(n - 1)
	return(result)

}


factorial_w(10)

10*9*8*7*6*5*4*3*2*1
















