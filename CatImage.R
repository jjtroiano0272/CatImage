M <- read.csv("./Cat.csv", header = FALSE)
d <- dim(M)
#as.raster(M) # Then you use plot() to plot this data.

# Check-step to verify matrix contains no negative values
# Returns 0 if no negative elements are present
isPositive <- FALSE
if (sum(M >= 0))
  isPositive <- TRUE

# (4) Defining Xmask, Ymask
Xmask <- matrix(c(-1, 0, 1, -2, 0, 2, -1, 0, 1), nrow = 3, ncol = 3, byrow = TRUE)
Ymask <- t(Xmask) #A

# TODO: U[2, 2] must be variable indices, M[1:3] must alos be variable indices.
# Fills a matrix as big as M but with zeroes.
U <- M * 0
# CAUTION! You're doing type conversions here and that may cause unstable data.
U[2, 2] <- sum(as.matrix(M[1:3, 1:3]) %*% Xmask)

#Keeps a 3x3 matrix throughout in selections
row <- 1
col <- 1
# Successfully moves through matrix entirely.
# TODO: Move through matrix in 3x3 block operations
# I believe U will go UP UNTIL ncol(M)-2 and save it to U[ncol(M)-2]
for (row in 1:nrow(M)) {
  for (col in 1:ncol(M)) {
    print(paste("Row", row, " Column ", col))
    # TODO: U[2, 2] <- sum(as.matrix(M[1:3, 1:3]) %*% Xmask)
    # Selecting 3x3 blocks
    # Make sure it has an upper limit
    M[row:row+2, col:col+2]
  } 
}

# Test Materials
############
U_test <- M_test * 0
for (row in 1:nrow(M_test)) {
  for (col in 1:ncol(M_test)) {
    # TODO: U[2, 2] <- sum(as.matrix(M[1:3, 1:3]) %*% Xmask)
    # Selecting 3x3 blocks
    # Make sure it has an upper limit
    M[row:row+2, col:col+2]
  } 
}
M_test <- matrix(1:36, nrow = 6, ncol = 6, byrow = TRUE)