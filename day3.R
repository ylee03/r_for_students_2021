# R script (R 수업 셋째 날 수업 중 직접 입력해서 실행했던 R 코드)
# day3.R

fv <- numeric(0)

fv[1] <- 0
fv[2] <- 1

fv[3] <- fv[1] + fv[2]
fv[4] <- fv[2] + fv[3]


# fv[n] <- fv[n-1] + fv[n-2]



fv[1] <- 0
fv[2] <- 1
for (i in 3:30) fv[i] <- fv[i-1] + fv[i-2]
	

fv[13]

fibonacci <- function(n) {

	fv <- numeric(0)
	fv[1] <- 0
	fv[2] <- 1
	for (i in 3:n) 
		fv[i] <- fv[i-1] + fv[i-2]
	
	return(fv[n])
}

fibonacci(13)
fibonacci(26)
fibonacci(1) # error


fibonacci <- function(n) {

	if (n <= 2) return(n - 1)
		
	fv <- numeric(0)
	fv[1] <- 0
	fv[2] <- 1
	for (i in 3:n) 
		fv[i] <- fv[i-1] + fv[i-2]
	
	return(fv[n])
}

# shifting technique


fibonacci_2 <- function(n) {
	
	if (n <= 2) return(n - 1)
			
	n_minus_2 <- 0
	n_minus_1 <- 1
	
	for (i in 3:n) {
		n_0 <- n_minus_2 + n_minus_1
		n_minus_2 <- n_minus_1
		n_minus_1 <- n_0
	}
	
	return(n_0)
}


fibonacci_2(25)


# recursion

fibonacci_3 <- function(n) {
	
	if (n <= 2) return(n - 1)	
	result <- fibonacci_3(n - 1) + fibonacci_3(n - 2)
	
	return(result)
		
}


fibonacci_3(3)
fibonacci_3(30)


s <- Sys.time()
fibonacci(30)
(Sys.time() - s)


s <- Sys.time()
fibonacci_2(30)
(Sys.time() - s)


s <- Sys.time()
fibonacci_3(30)
(Sys.time() - s)


#-----------------------------------------------------
# 


fibonacci <- function(n) {

	if (n <= 2) return(n - 1)
		
	fv <- numeric(0)
	fv[1] <- 0
	fv[2] <- 1
	for (i in 3:n) 
		fv[i] <- fv[i-1] + fv[i-2]
	
	return(fv)
}

fibonacci(10)


c(fibonacci_2(1), fibonacci_2(2), fibonacci_2(3), fibonacci_2(4),
	fibonacci_2(5), fibonacci_2(6), fibonacci_2(7), fibonacci_2(8),
	fibonacci_2(9), fibonacci_2(10))


for (i in 1:10) print(fibonacci_2(i))


v1 <- fibonacci(10)
v2 <- sapply(1:10, function(x) fibonacci_2(x))
v3 <- sapply(1:10, function(x) fibonacci_3(x))


v <- cbind(v1, v2, v3)
v[7, 2]
v[7, "v2"]

colnames(v) <- c("original", "shifting", "recursion")

v[8, "shifting"]
v[8:10, "shifting"]
v[ , "shifting"]
v[8, ]

v <- cbind(v, v[, "shifting"] - v[, "recursion"])
colnames(v)[4] <- "shifting - recursion" 

v <-  v[ , -4]

apply(v, 1, mean)
apply(v, 2, mean)


#-----------------------------------------------------
# 

fibonacci_4 <- function(n) {
	
	phi <- (1 + sqrt(5)) / 2
	return(round(phi^n / sqrt(5)))
	
} 

fibonacci_4(10)
fibonacci_4(1:10)
sapply(1:10, function(x) fibonacci_4(x))



#-----------------------------------------------------
# how to locate a difference between fibonacci numbers by two method


fibonacci_2(i+1)
fibonacci_4(i)

i <- 2
while( (fibonacci_2(i+1) - fibonacci_4(i)) == 0  ) {
	i <- i + 1
}

print(i)
print(fibonacci_2(i+1), 10)
print(fibonacci_4(i), 10)


# answer
shifting <- sapply(1:(i+1), function(x) fibonacci_2(x))
approximation <- c(0, fibonacci_4(1:i))
gap <- shifting - approximation
v <- cbind(shifting, approximation, gap)
print(v, 10)


#-----------------------------------------------------







#-----------------------------------------------------
# sorting

v1 <- c(7, 5, 4, 10, 5, 1, 11, 2, 9, 8, 6, 3)
sort(v)

v2 <- sample(1:100, 20, replace = TRUE)
v3 <- rnorm(20, 50, 15)
v4 <- rnorm(1000, 50, 15)

# easy sort

easySort <- function(x) {
	
	n <- length(x)
	
	for (i in 0:(n - 2)) {

		for (j in 2:(n - i)) {
			if (x[j - 1] > x[j]) {
				temp <- x[j - 1]
				x[j - 1] <- x[j]
				x[j] <- temp
			}

		}
	}
	
	return(x)
}

easySort(v1)
easySort(v2)
easySort(v3)
easySort(v4)


# quicksort


quicksort_v0 <- function(x) {
	
	
	if (length(x) <= 1) return(x)
		
	pivot <- x[1]
	remainder <- x[-1]
	
	left <- numeric(0)
	right <- numeric(0)
	
	for (i in 1:length(remainder)) 
		if (remainder[i] < pivot) {
			left <- c(left, remainder[i]) }  else {
				right <- c(right, remainder[i])
			}
	
		
	left <- quicksort(left)
	right <- quicksort(right)
	
	result <- c(left, pivot, right)
	return(result)
	
}

quicksort_v0(v2)


quicksort <- function(x) {
	
	
	if (length(x) <= 1) return(x)
		
	pivot <- x[1]
	remainder <- x[-1]
	
	left <- remainder[remainder < pivot]
	right <- remainder[remainder >= pivot]
		
	left <- quicksort(left)
	right <- quicksort(right)
	
	result <- c(left, pivot, right)
	return(result)
	
}

quicksort(v2)


# 교재 14쪽 과제 2
# 주어진 n개의 요소를 가지는 숫자 벡터를 퀵소트 알고리듬에 넣었을 때 피봇을 2/n번째 값으로 잡는 quicksort_med() 함수를 만든다.







































