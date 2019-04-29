M_raw <- read.csv("./Cat.csv", header = FALSE)
M <- as.matrix(read.csv("./Cat.csv", header = FALSE))
d <- dim(M)
d[1] # Number of rows
d[2] # Number of columns
#as.raster(M) # Then you use plot() to plot this data.

# Check-step to verify matrix contains no negative values
# Returns 0 if no negative elements are present
isPositive <- FALSE
if (sum(M >= 0))
  isPositive <- TRUE

# (4) Defining Xmask, Ymask
Xmask <- matrix(c(-1, 0, 1, -2, 0, 2, -1, 0, 1), nrow = 3, ncol = 3, byrow = TRUE)
Ymask <- t(Xmask)

# TODO: U[2, 2] must be variable indices, M[1:3] must alos be variable indices.
# Fills a matrix as big as M but with zeroes.
U <- M * 0
# CAUTION! You're doing type conversions here and that may cause unstable data.
U[2, 2] <- sum(as.matrix(M[1:3, 1:3]) %*% Xmask)

# I believe U will go UP UNTIL ncol(M)-2 and save it to U[ncol(M)-2]
# TODO: The error comes about because the first element is -1 (because we substract 2)
for (row in 1 : (d[1]-2) ) {
  
  for (col in 1 : (d[2]-2) ) {
    # Possible IF dim check
    if ( dim(M[row:row+2, col:col+2])[1] == dim(Xmask)[2] ) {
      M[row:row+2, col:col+2] %*% Xmask
    }
  }
}






# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Test Materials
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
M_test <- matrix(1:36, nrow = 6, ncol = 6, byrow = TRUE)
U_test <- M_test * 0

for (row in 1 : (nrow(M_test) - 2) ) {
  for (col in 1 : (ncol(M_test) - 2) ) {
    # TODO: Assigning to U....
    # sum() returns a single value from an mxn matrix
    sum(M_test[row:row+2, col:col+2] %*% Xmask) # This selects a 3x3 matrix and sums its product with Xmask
  } 
}

# TODO: U goes from U[2, 2] to U[nrow(U) - 1, ncol(U) - 1]