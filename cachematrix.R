## Put comments here that give an overall description of what your
## functions do

## create a special 'matrix' object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {

    inverse <- NULL

    # set the matrix value
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }

    # get the matrix value
    get <- function() {
        x
    }

    # set the matrix's inverse
    setinverse <- function(inv) {
        inverse <<- inv
    }

    # gets the matrix's inverse
    getinverse <- function() {
        inverse
    }

    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## returns the inverse of the matrix x (must be a special 'cache matrix')
## uses the cached inverse if it is available, else calculates it and caches the inverse.

cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(is.null(inv)) {
        message("calculating and caching")
        inv <- solve(x$get())
        x$setinverse(inv)
    } else {
        message("using cache")
    }

    inv
}
