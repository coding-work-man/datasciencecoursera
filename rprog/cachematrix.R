# The function to cache the inverse of a matrix. Input x is a matrix
# Usage : 
# reversed.matrix = makeCacheMatrix(x)
## first time calculate the reverse 
# cacheSolve(reversed.matrix)
## now using the cached reverse
# cacheSolve(reversed.matrix)


# Funtion makeCacheMatrix will create helper function: get,set, serinverse,
# getinverse for a matrix input
# Input : x -- matrix
# Output: a list point to get,set, setinverse,getinverse of the matrix 

makeCacheMatrix <- function(x = matrix()) {
  inv=NULL
  # set function 
  set<-function(y) {
    x<<-y
    inv<<-NULL
  }
  # function to get the matrix x
  get <- function() x
  # set the inverse
  setinverse <- function(inverse) inv <<- inverse
  # return the inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


# Function cacheSolve will fetch the inverse for the matrix if it's already cached 
# if the inverse is not cached then it will calculate the inverse and then cache it
# Input : x -- list return by makeCacheMatrix
# Ouput :

cacheSolve <- function(x, ...) {
  
  # fetch the inverse from the cache 
  inv <- x$getinverse()
  # if already cached then fetch the cache and return it
  if(!is.null(inv)) {
    message("getting invese matrix")
    return(inv)
  }
  # if not cached then get the matrix
  data <- x$get()
  # calculate the inverse
  inv <- solve(data, ...)
  # cache the inverse
  x$setinverse(inv)
  inv
}