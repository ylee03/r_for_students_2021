# R script
# day 6


data(Orthodont, package = "nlme")

p=Orthodont
q=p[p$age<9,]
tapply(q[,1],q$Sex,function(x)c(mean(x),sd(x)))
by(q[,1],q$Sex,function(x)c(mean(x),sd(x)))


#

x0 <- 0
y0 <- 0

radius <- 1
theta <- 0:90
theta_radian <- theta * pi / 180

x <- x0 + radius * cos(theta_radian)
y <- y0 + radius * sin(theta_radian)

plot(x, y, type = "l", xlim = c(-1, 1), ylim = c(-1, 1)) #

theta <- 90:180
theta_radian <- theta * pi / 180

x <- x0 + radius * cos(theta_radian)
y <- y0 + radius * sin(theta_radian)
lines(x, y, type = "l")


#-----------------------------------------------------

fibonacci <- function(n) {
	
	if (n < 3) return(n - 1)
	x <- 0
	y <- 1
	
	for (i in 3:n) {
		z <- x + y
		x <- y
		y <- z
	}
	
	return(z)	
}

sapply(1:12, fibonacci)

deg2rad <- function(d) return(d * pi / 180)
sapply(0:90, deg2rad)

quadrant <- 1
(deg <- ((quadrant - 1) * 90) : (quadrant * 90) )


plot(0, 0, xlim = c(-1, 1), ylim = c(-2, 1), type = "n")


d <- ((quadrant - 1) * 90 ) : (quadrant * 90)
rad <- deg2rad(d)
x0 <- 0; y0 <- 0
r <- 1
lines(x0 + r * cos(rad), y0 + r * sin(rad))

quadrant <- 2
(deg <- ((quadrant - 1) * 90) : (quadrant * 90) )
d <- ((quadrant - 1) * 90 ) : (quadrant * 90)
rad <- deg2rad(d)
x0 <- 0; y0 <- 0
r <- 1
lines(x0 + r * cos(rad), y0 + r * sin(rad))


quadrant <- 3
d <- ((quadrant - 1) * 90 ) : (quadrant * 90)
rad <- deg2rad(d)
x0 <- x0 + 1 ; y0 <- y0
r <- 2
lines(x0 + r * cos(rad), y0 + r * sin(rad))


# 
#-----------------------------------------------------

arc <- function(x0, y0, r = 1, quadrant) {
	
	d <- ((quadrant - 1) * 90 ) : (quadrant * 90)
	rad <- deg2rad(d)
	lines(x0 + r * cos(rad), y0 + r * sin(rad), lwd = 1.3)
	return(0)
}

arc(0, 0, r = 1.5, quadrant = 4)


#-----------------------------------------------------
# n-th arc

n <- 10
move <- rbind(
	rep( c(+1, 0, -1, 0), length = n - 2 ),
	rep( c(0, +1, 0, -1), length = n - 2 )
	)

rownames(move) <- c("x", "y")


n <- 5
x0 <- x0 + fibonacci(n - 1) * move["x", n - 2]
y0 <- y0 + fibonacci(n - 1) * move["y", n - 2]


#-----------------------------------------------------
plot(c(-10, 10), c(-10, 10), type = "n", axes = FALSE, xlab = "", ylab = "") #

x0 <- y0 <- 0


r <- 1
i <- 1
arc(x0, y0, r = fibonacci(i + 1), quadrant = 1)


i <- 2
arc(x0, y0, r = fibonacci(i + 1), quadrant = 2)

i <- 3
x0 <- x0 + fibonacci(i - 1) * move["x", i - 2]
y0 <- y0 + fibonacci(i - 1) * move["y", i - 2]
arc(x0, 
	y0, 
	r = fibonacci(i + 1), quadrant = 3)

# 4th and 5th
for (i in 4:5) {
	x0 <- x0 + move["x", i - 2] * fibonacci(i - 1)
	y0 <- y0 + move["y", i - 2] * fibonacci(i - 1)
	r <- fibonacci(i + 1)
	quad <- ifelse(i %% 4, i %% 4, 4)
	arc(x0, y0, r = r, quadrant = quad ) #
}

#-----------------------------------------------------
#-----------------------------------------------------
golden_spiral <- function(n) {
	
	max <- fibonacci(n + 1)
	move <- rbind(
		rep( c(+1, 0, -1, 0), length = n - 2 ),
		rep( c(0, +1, 0, -1), length = n - 2 )
		)
	rownames(move) <- c("x", "y")
	
	
	
	plot(c(-max, max), c(-max, max), type = "n",
		axes = FALSE,
		xlab = "", ylab = "")
	
	
	x0 <- y0 <- 0
	r <- 1
	
	# n = 1
	arc(x0, y0, r = fibonacci(2), quadrant = 1)
	
	# n = 2
	arc(x0, y0, r = fibonacci(3), quadrant = 2)
	
	# n > 2
	for (i in 3:n) {
		x0 <- x0 + move["x", i - 2] * fibonacci(i - 1)
		y0 <- y0 + move["y", i - 2] * fibonacci(i - 1)
		r <- fibonacci(i + 1)
		quad <- ifelse(i %% 4, i %% 4, 4)
		arc(x0, y0, r = r, quadrant = quad)		
	}
	
	return(0)
	
} # golden_spiral

golden_spiral(n = 50)


#-----------------------------------------------------

bliss <- data.frame(
	dead = c(2, 8, 15, 23, 27),
	alive = c(28, 22, 15, 7, 3),
	conc = 0:4)
	
barplot(rbind(bliss$alive, bliss$dead))


DEAD <- 1
ALIVE <- 0

x <- rep(0:4, each = 30)
m <- bliss[, 1:2]
y <- as.vector( apply(m, 1, function(x) c( rep(DEAD, x[1]), rep(ALIVE, x[2])))) #

plot(jitter(x), jitter(y))


bliss.glm <- glm(cbind(dead, alive) ~ conc, bliss, family = binomial) #
ilogit <- function(x, a = 1.162, b = -2.324) return(
	1 / (1 + exp(-(a * x + b))))
	
conc <- seq(0, 4, length = 30)
cbind(conc, ilogit(conc))

lines(conc, ilogit(conc))





plot(jitter(x), jitter(y, 0.3), axes = FALSE, xlab = "Concentration of Insecticide", ylab = "Expected Probability of Death") #

axis(1, at = 0:4, label = 0:4)
axis(2, at = 0:1, label = c("Alive", "Dead"))
axis(3, at = 0:4, label = 0:4)

lines(conc, ilogit(conc), lwd = 2)



#-----------------------------------------------------
# 1, 2, 3, 4 분면에 차례로 arc를 그리고 있는데
# 3, 4, 1, 2 분면의 순서로 arc를 그리도록 코드를 고치는 과제
# 조별 과제

# 다음 주 목요일 밤 9시

