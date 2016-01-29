## Put comments here that give an overall description of what your
## functions do
#  These functions return an inverse matrix of x from cache if available
#  If not available, inverse is computed and set in cache

## Write a short comment describing this function
# Function to get/set inverse matrix from cache
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }

    get <- function() {
        x
    }

    setInverseMatrix <- function(inverseMatrix) {
        m <<- inverseMatrix
    }

    getInverseMatrix <- function() {
        m
    }

    list(set = set, get = get, 
         setInverseMatrix = setInverseMatrix,
	 getInverseMatrix = getInverseMatrix)
}


## Write a short comment describing this function
#  Function to calculate inverse if not exists in cache
cacheSolve <- function(x, ...) {
    m <- x$getInverseMatrix()

    if( !is.null(m) ) {
        message("getting cached data")
	return(m)
    }

    dataMatrix <- x$get()

    m <- solve(dataMatrix)

    x$setInverseMatrix(m)

    ## Return a matrix that is the inverse of 'x'
    m
}
