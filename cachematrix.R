## Code submitted as solution for R Programming - Assignment 2.  Since Matrix inversion is usually a costly computation, this pair of functions caches the 
## inverse of a matrix rather than compute it every time (assuming the matrix does not change).

## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {

    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}
## Run the following in Console to test:
## MyMatrix <- makeCacheMatrix()
## m <- matrix(c(4,3,3,2),2,2)
## MyMatrix$set(m)
## cacheSolve(MyMatrix)
## m <- matrix(c(2, 1, 0, 0, 3, 0, 2, 2, 1, 3, -3, 3, 5, 1, 2, 1),4,4)
## MyMatrix$set(m)
## cacheSolve(MyMatrix)