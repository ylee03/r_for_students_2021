# Script for day 5 (Jun 6, 2021)

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




Suicide <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/vcd/Suicide.csv", header = TRUE) #

str(Suicide)
str(Suicide[ , -1])
Suicide <- Suicide[, -1]
str(Suicide)


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

