# Day 1

## Using R as a calculator
## R can perform normal arithmetic operations

1 + 2

3 + 4

3 * 12

3 / 3

2 ** 4

2.0 * 1.4

3e4 # Use this format for scientific notation

### R also has a wide range of mathematical functions

log(4)
log2(4)
sin(1 / 2)
exp(3)

### Comparisons
### Often we want to compare two things
### We can do that using the following operators
### Each of these return TRUE or FALSE

10 < 20 # Less than
20 > 10 # Greater than
10 <= 20 # Less than or equal to
20 >= 10 # Greater than or equal to
10 == 20 # Equality
10 != 20 # Inequality

# Variables
# Variables are buckets that we use to store information

## We assign values to a variable using the <- operator
x <- 10
x

## The = operator can also be used but this is often considered bad style
## and can be confusing as it is used for other reasons
## We include it here as you may see it used for examples on the internet
x = 12
x

## Variables can be used in functions in the same was a regualar values
log(x)
x <- 3
log(x)

## We can also create new variables from existing ones
x <- 6
y <- x + 3
y

## What is my variable?
## Use this functions to find out more about what your variable is

str(x) # structure
my_name <- "Luke"
str(my_name)

class(x)
class(my_name)

## Managing variables

### Use ls() to see what varaibles exists
### (You can also use the Environment window in RStudio)
ls()
ls(all.names = TRUE) # Use this option to see hidden variables

### Use rm() to remove a variable you don't need any more
rm(".mass")
my_var <- "test"
rm("my_var")
ls(all.names = TRUE)

## Seeking help
## If you are not sure how something works the first thing to do is check the
## documentation

help("ls")
?help # ? is a shortcut
??csv # Use ?? to search

## If the documentation doesn't help you should search for your problem/error
## on the internet
##
## Often this will take you to StackOverflow which is a programming question
## and answer site
##
## If you can't find your problem you can post a new question, but make sure you
## have a look first

sessionInfo() # This function prints information about your computing
              # environment. It can be useful to help answer questions.

## Data types

### There are five main types of data in R
###
### Numeric:
###     Double
typeof(1.3)
typeof(1)
###     Integer
typeof(1L)
###     Complex
typeof(1 + 2i)
### Logical
typeof(TRUE)
typeof(FALSE)
### Character
typeof("My string")

### Missing data
### Missing data is represented using NA
### There are special types of NA for each data type
typeof(NA)
typeof(NA_integer_)

### Special comparisons
### You can check if a value is NA using
is.na(NA)
### There are also checks for finite numbers and NaN (not a number)
is.finite(100)
is.finite(Inf)
is.infinite(Inf)
is.nan(0 / 0)

## Data structures
## So far we have only looked a single values but most of the time we want to
## group information to given.
## To do that we place it in a data structure.

### Vector
### Vectors are the simplest data structure. They are ordered groups of single
### values of the same type.

### The vector function creates an empty vector
my_vector <- vector(length = 3)
my_vector

chr_vector <- vector(length = 3, mode = "character")
chr_vector

str(my_vector)

### It is more common to create vectors by combining values using the c()
### function
combine_vector <- c(2, 6, 3)
combine_vector

### What happens if try to create a vector with multiple types?
quiz_vector <- c(2, 6, "3")
quiz_vector

### Coercion
### If muliple types are combined R coerces the more specific types to the
### more general in this order:
### logical -> integer -> double -> complex -> chracter

c(TRUE, FALSE, 3)
numbers <- c(1, 2, 3)
numbers

### We can use the as.TYPE() functions to force coercion to a particular type
num_string <- as.character(numbers)
num_string

as.numeric(num_string)

as.numeric(c("1", "A"))

### Vector functions

### Vectors of numbers can be created using the sequence function
my_sequence <- seq(from = 1, to = 10, by = 1)
my_sequence
seq(-2.4, 5.7, 0.3)
my_sequence <- 1:10 # The : operator is a shortcut for sequences increasing by 1
my_sequence

### The head and tail function work on vectors in the same way as they work
### on files in the shell
head(my_sequence)
head(my_sequence, 3)

tail(my_sequence)
tail(my_sequence, 4)
tail(my_sequence, 12)

### length() returns the number of items in a vector
length(my_sequence)

### We can also create vectors with names
ages <- c(Emily = 2, Mark = 20, Denis = 41)
ages
### The names() function can be used to set or replace names
names(ages)
names(ages) <- c("A", "B", "C")
ages

# CHALLENGE: Start by making a vector with the numbers 1 through 26. Multiply
# the vector by 2, and give the resulting vector names A through Z (hint: there
# is a built in vector called LETTERS)

# Answer 1
task <- seq(1:26)
task
task <- task * 2
names(task) <- c(LETTERS)
task

# Answer 2
numbers <- 2 * seq(26)
names(numbers) <- letters

## Factors

# Factors are special vectors with labels
# R stores the labels once then uses numbers to store all the values
# Often we don't want factors but they are useful for categorical data

coats <- c("tabby", "tortoiseshell", "black", "tabby")
coats
str(coats)

CATegories <- factor(coats) # Use factor() to create a factor from a vector
CATegories
typeof(coats)
typeof(CATegories)

mydata <- c("case", "control", "control", "case")
# If we want to control the order of labels we need to set levels
mydata_factor <- factor(mydata,
                        level = c("control", "case"))
mydata_factor
str(mydata_factor)

## Lists

# Lists are a flexible collection of items
# Can hold any combination of types/objects

my_list <- list(1, "a", TRUE, 1+4i)
my_list

# We can put vectors (or other data structures) inside lists
list2 <- list(title = "Numbers",
              numbers = 1:10,
              data = TRUE)
list2
typeof(list2)
str(list2)

list_of_lists <- list(my_list, list2)
list_of_lists

# CHALLENGE: Make a list. Item 1 will be a vector of data types, item 2 will be
# a vector of data structure, item 3 your favourite number. Give each item in
# the list a name.

# Answer 1
dataTypes <- c("Logical", "Int", "Double",
               "Complex", "Chr")
dataStructures <- c("Vector", "Factor", "List")
faveNum <- 47
Stuff <- list(dataTypes, dataStructures, faveNum)
names(Stuff) <- c("Data Types", "Data Structures",
                  "My favourite number")


# Answer 2
z <- c("double","integer","character","logical","complex")
z2 <- c("vector","factor","list")
z3 <- 7
my_list <- list(z,z2,z3)
names(my_list) = c("types","structures","number")

# Answer 3
datatypes <- c("logical", "integer", "double", "complex", "character")
datatypes
datastructure <- c(1:15)
datastructure
number <- 16
my_list2 <- list(datatypes, datastructure, number)
my_list2

# Answer 4
test_list <- list(dataType = c("double", "integer", "complex", "character",
                               "logical"),
                  dataStructure = c("vector", "factor", "list"),
                  myNumber =3)

data_types <- c("Numeric","character","logical")
data_structures <- c("vector","factor","list")
combine_Data_list<-list(datatypes = data_types,
                        datastr = data_structures,
                        favorite_num = 3
)
combine_Data_list

# Answer 5
item_1 <- list("character", "numeric", "integer", "logical", "complex")
item_2 <- list("vector", "factor", "list", "matrix", "dataframe" )
item_3 <- 7
list_of_items <- list(title = "THE LIST", data_types = item_1,
                      data_structure = item_2, fave_num = item_3)
list_of_items

## Matrices

# Vector that has been folded into 2 dimension
# Has rows and columns
# Only one type

matrix_example <- matrix(0, ncol = 6, nrow = 3)
matrix_example
class(matrix_example)
typeof(matrix_example)
str(matrix_example)

# Functions for finding the dimensions of a matrix
dim(matrix_example)
nrow(matrix_example)
ncol(matrix_example)

# Because matrices are two dimensional they have row and column names
rownames(matrix_example) <- c("A", "B", "C")
colnames(matrix_example) <- c("a", "b", "c", "d", "e", "f")
matrix_example

## Subsetting
## Subsetting refers to extracting bits of information from a data structure

x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
?c

# We can subset using indices (numbers referring to the position of values
# starting from 1)
x[1]
x[c(1, 3)] # Multiple indices extract multiple items
x <- x[-4] # Negative indices skip items
x
x[6] # If we use an index that doesn't exist R returns NA

x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
x

x[-1:3] # Combining negative and positive indices doesn't work

x[-(1:3)] # Need to negate the whole vector

# If a vector has names we can use them to subset
x[c("b", "c", "d")]

# We can also use logical vectors to subset
# TRUE return an item and FALSE doesn't
x[c(FALSE, FALSE, TRUE, FALSE, FALSE)]

# Any function that returns a logical vector can be used, such as comparisons
x[names(x) == "a"]

x[x >7]

# Multiple comparisons can be combined using and (&), or (|) operators
x[x >7 & x < 5]
x[x >7 | x < 5]

# Multiple items in a vector can have the same name but only one is returned
x <- 1:3
names(x) <- c("a", "a", "a")
x['a']

# Need a comparison to get them all
x[names(x) == "a"]

x <- c(a=5.4, b=6.2, c=7.1, d=4.8, e=7.5)

# Trying to skip a name doesn't work
x[-"a"]

# Need to use a comparison again!
x[names(x) != "a"]

# This works for multiple names but gives a warning and the wrong results
x[names(x) != c("a", "b")]
x[names(x) != c("a", "c")]

# When R compares two vector that are different lengths the shorter one is
# recycled. This is what is causing the problem.
names(x) != c("a", "c")

# In this case we want to use the %in% operator
x[!names(x) %in% c("a", "c")]

## Subsetting of matrices is similar to vectors but we need to give two
## indicies, one for rows and one for columns
set.seed(1)
m <- matrix(rnorm(6 * 4), ncol = 4, nrow = 6)
m

m[2,2]

# If we leave one empty we can extract a whole row or column
m[2, ]
# Unlike vectors R returns an error if we go out of bounds instead of NA
m[, 5]
m[, 4]

# We can also use vectors to extract multiple rows or columns
m[3:4,]
m[3:4, c(3, 1)]

# By default when we extract a single row/column R converts it to a vector,
# to stop this happening we set drop = FALSE
m[3,]
m[3, , drop = FALSE]

m <- matrix(1:18, nrow=3, ncol=6)
m

# Matrices only have two dimenstions, if we supply more indices we get a error
m[2, 4, 2, 5]

# If we only supply one R treats the matrix as a vector
m[2:5]
m[5]

m[2, c(4, 5)]


## Subsetting lists
xlist <- list(a = "Software Carpentry", b = 1:10, data = head(iris))
xlist

# Uses single brackets [ ] returns a list with those items
xlist[1:2]

# To extract a single item we use double brackets [[ ]]
xlist[[1]]
xlist[["a"]]

# For named lists we can use the $ operator as a shortcut
xlist$b
xlist$data
