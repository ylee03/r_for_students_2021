# R script (R 수업 4째 날 사용하는 스크립트)
# day4.R




# 제3일 과제 답안

quicksort <- function(x) {
	
	
	if (length(x) <= 1) return(x)
	
	pivot_loc <- 1
	pivot <- x[pivot_loc]
	remainder <- x[-pivot_loc]

	left <- remainder[remainder < pivot]
	right <- remainder[remainder >= pivot]
	
	left <- quicksort(left)
	right <- quicksort(right)
	
	result <- c(left, pivot, right)
	return( result )
}

# 중간에 위치한 값을 피봇으로
quicksort_med <- function(x) {
	
	
	if (length(x) <= 1) return(x)
	
	pivot_loc <- length(x)/2
	pivot <- x[pivot_loc]
	remainder <- x[-pivot_loc]

	left <- remainder[remainder < pivot]
	right <- remainder[remainder >= pivot]
	
	left <- quicksort_med(left)
	right <- quicksort_med(right)
	
	result <- c(left, pivot, right)
	return( result )
}

numbers <- round(rnorm(101, 100, 25))
summary(numbers)
quicksort_med(numbers)



#-----------------------------------------------------


DrugP <- data.frame( 
	subject = c("A", "B", "C", "D", "E", "F"),
	beforeP = c(4.3, 5.6, 3.9, 5.7, 4.8, 5.2),
	afterP = c(5.7, 5.4, 4.6, 7.3, 6.0, 5.3)
	)
	
DrugP$subject <- as.character(DrugP$subject)
str(DrugP)


DrugP[3, 2]
DrugP[3, 2:3]
DrugP[, "beforeP"]


#-----------------------------------------------------


Plasma <- read.table("plasma.csv", sep = ",", header = TRUE),
Plasma <- read.csv("plasma.csv", header = TRUE)

P2 <- read.csv("/Users/ylee/Desktop/plasma.csv", header = TRUE)



Suicide <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/vcd/Suicide.csv", header = TRUE) #

str(Suicide)
str(Suicide[ , -1])
Suicide <- Suicide[, -1]
str(Suicide)


#-----------------------------------------------------


"/Users/ylee/Desktop/plasma.csv" # unix, mac
"\Users\ylee\Desktop\plasma.csv" # windows


#-----------------------------------------------------

data(Orthodont, package = "nlme")
head(Orthodont, 10)




schools_left <- data.frame(
	id = c(1, 2, 5, 6),
	left_school = c(
		"Oak Street School",
		"Roosevelt High Scool",
		"Washington Middle School",
		"Jefferson High School"),
	stringsAsFactors = FALSE
	)

schools_right <- data.frame(
	id = c(1, 2, 3, 4, 6),
	right_school = c(
		"Oak Street School",
		"Roosevelt High School",
		"Morrison Elementary",
		"Chase Magnet Academy",
		"Jefferson High School"),
		stringsAsFactors = FALSE
		)
		
schools_dupl <- rbind(
	schools_right,
	data.frame(
		id = 1,
		right_school = "Every Valley School")
		)


airlines <- read.csv("https://raw.githubusercontent.com/ylee03/r_for_students_2021/main/dataset/airlines.csv", header = T) #
airports <- read.csv("https://raw.githubusercontent.com/ylee03/r_for_students_2021/main/dataset/airports.csv", header = T) #
planes <- read.csv("https://raw.githubusercontent.com/ylee03/r_for_students_2021/main/dataset/planes.csv", header = T) #
weather <- read.csv("https://raw.githubusercontent.com/ylee03/r_for_students_2021/main/dataset/weather.csv", header = T) #

# flights 로딩 때는 현재 오류!!
# 추후 개선판을 제작하겠습니다
flights <- read.csv("https://raw.githubusercontent.com/ylee03/r_for_students_2021/main/dataset/flights.csv", header = T) #

#-----------------------------------------------------

tapply(
	Orthodont$distance,
	Orthodont$Sex,
	mean)


tapply(
	Orthodont$distance,
	Orthodont$Sex,
	sd)

with(Orthodont,
	tapply(distance, age, mean)
	)


with(Orthodont,
	tapply(distance, age, c(mean, sd) )
	)


with(Orthodont,
	tapply(distance, age, function(x) c(mean(x), sd(x)))
	)

with(Orthodont,
	tapply(distance, Sex, function(x) c(mean(x), sd(x)))
	)


with(Orthodont,
	tapply(distance, Sex, function(x) round(c(mean(x), sd(x)), 1))
	)


with(Orthodont,
	tapply(distance, list(Sex, age),  mean )
	)

unique( Orthodont$Subject )


# nycflights 다운로드 받는 법 개선

# install.packages("nycflights13")
library(nycflights13)


#-----------------------------------------------------
# game369 제작 퀴즈
# 금요일 저녁 9시


# 1, 2, *, 4, 5, *, 7, 8, *, 10
# 11, *, *, 14, *, *, 17, *, *, 20
# ....
# ....
# 

game369 <- function(x) {
	
	
	
	return(result)
} 



game369(1)
1

game369(3)
"*"

1:100


