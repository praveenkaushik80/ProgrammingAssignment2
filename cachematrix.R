## Put comments here that give an overall description of what your
## functions do

## Functions that cache the inverse of a matrix

## Write a short comment describing this function

## Create special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL
  ## Method to set the matrix
  set <- function (matrix) {
    a <<- matrix
    inv <<- NULL
  }
  ## Method to get the matrix
  get <- function () {
    a
  }
  ## Method to set inverse of the matrix
  setInverse <- function (inverse) {
    inv <<- inverse
  }
  ## Method to get inverse of the matrix
  getInverse <- function () {
    inv
  }
  ## Return list of methods
  list (set = set, get = get, setInverse = setInverse,
        getInverse = getInverse)
}


## Write a short comment describing this function
## cacheSolve computes inverse of special matrix returned by makeCacheMatrix
## as follows if inverse has already been calculated for the matrix,
## the inverse of the matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  a <- x$getInverse()
  ## Return inverse of 'x' if already set
  if (!is.null(a)) {
    message ("getting cached data")
    return (a)
  }
  ## get the matrix from makeCacheMatrix method
  b <- x$get()
  ## compute inverse using matrix multiplication
  a <- solve (b) %*% b
  ## set the inverse from makeCacheMatrix method
  x$setInverse (a)
  a
}

