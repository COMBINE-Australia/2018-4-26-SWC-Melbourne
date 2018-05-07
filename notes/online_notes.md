COMBINE Software Carpentry Workshop
===================================

**Melbourne April 26 and May 3**

Sticky notes on the top of your laptop: 
    - Yellow: I'm ok!
    - Pink: I need some assistance!

## Challenge #1 - Find this page and write your name below
- Andrew
- Charis
- Nynke
- Keren
- Kristy
- Jaclyn
- Deborah
- Kat
- Pengxing
- Alyssa
- Tharkeshi
- Mathilda
- Sarah 
- Jocelyn
- Dominic
- Payal
- Jonathan
- Bec
- Kate
- Hayley
- Qian Feng
- xining

# Unix Shell

## Challenge #2 - Get the data

You need to download some files to follow this lesson:

Download and move the file to your Desktop.

Unzip/extract the file (ask your instructor if you need help with this step). You should end up with a new folder called data-shell on your Desktop.
cd

Notes for today's Bash lesson: http://swcarpentry.github.io/shell-novice/

# R

## Variable names

Which of these are valid variable names?

min_height  Valid!
max.height Valid!
_age NO, can't start with _
.mass Valid, but hidden (don't do this)
MaxLength Valid
min-length Invalid
2widths Can't start with a number
celsius2kelvin Valid

## Challenges

1. What will be the value of each variable after each statement in the following program?

mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20

2. Run the code from the previous challenge, and writ
3. Je a command to compare mass to age. Is mass larger than age?

3. Clean up your working environment by deleting the mass and age variables.

## Vectors

Start by making a vector with the numbers 1 through 26. Multiply the vector by 2, and give the resulting vector names A through Z (hint: there is a built in vector called LETTERS)

Bec
vector <- 1:26
vector <- vector * 2
names(vector) <- LETTERS

Mathilda
task <-(1:26)
task
task <- task *2
names(task) <- (LETTERS)

Payal
x <- 1:26
x <- x*2
names(x) <- letters

Sarah
quiz<-seq(1,26)
doublequiz <- quiz*2
names(doublequiz) <-LETTERS

Alyssa 
a <- 1:26
a <- a*2
names(a) <- LETTERS

Pengxing
a1 <- (1:26)*2
names(a1) <- LETTERS
a1

Dom
numbers <- 2*seq(26)
names(numbers) <- letters

## Lists

Make a list. Item 1 will be a vector of data types, item 2 will be a vector of data structure,
item 3 your favourite number. Give each item in the list a name.

dataTypes <- c("Logical", "Int", "Double", "Complex", "Chr")
dataStructures <- c("Vector", "Factor", "List")
faveNum <- 47
Stuff <- list(dataTypes, dataStructures, faveNum)
names(Stuff) <- c("Data Types", "Data Structures", "My favourite number")


z <- c("double","integer","character","logical","complex")
z2 <- c("vector","factor","list")
z3 <- 7
my_list <- list(z,z2,z3)
names(my_list) = c("types","structures","number")


datatypes <- c("logical", "integer", "double", "complex", "character")
datatypes
datastructure <- c(1:15)
datastructure
number <- 16
my_list2 <- list(datatypes, datastructure, number)
my_list2

test_list <- list(dataType = c("double", "integer", "complex", "character", "logical"),
                  dataStructure = c("vector", "factor", "list"),
                  myNumber =3)

data_types <- c("Numeric","character","logical")
data_structures <- c("vector","factor","list")
combine_Data_list<-list(datatypes = data_types,
                        datastr = data_structures,
                        favorite_num = 3
)
combine_Data_list

item_1 <- list("character", "numeric", "integer", "logical", "complex")
item_2 <- list("vector", "factor", "list", "matrix", "dataframe" )
item_3 <- 7
list_of_items<- list(title="THE LIST", data_types=item_1,data_structure=item_2,fave_num=item_3)
list_of_items

x <- (1:26) * 2
names(x) <- letters  
typeslist <- list(1:26, letters, TRUE, rnorm(10,5,1), factor(x))
names(typeslist) <- c("int", "chr", "logi", "num","fac")

## Matrices

1. What do you think will be the result of length(matrix_example)? Try it. Were you right? Why / why not?
2. Did the matrix function fill your matrix by column, or by row, as its default behaviour?
   See if you can figure out how to change this. (hint: read the documentation for matrix!)
   my_matrix <- matrix(data=1:50,nrow=10,ncol = 5,byrow = TRUE)
3. Consider the R output of the matrix below:

     [,1] [,2]
[1,]    4    1
[2,]    9    5
[3,]   10    7

What was the correct command used to write this matrix? Examine each command and try to figure out the correct one before typing them. Think about what matrices the other commands will produce.

    matrix(c(4, 1, 9, 5, 10, 7), nrow = 3)
    matrix(c(4, 9, 10, 1, 5, 7), ncol = 2, byrow = TRUE)
    matrix(c(4, 9, 10, 1, 5, 7), nrow = 2)
    matrix(c(4, 1, 9, 5, 10, 7), ncol = 2, byrow = TRUE)

## Subsetting

Given the following code:

m <- matrix(1:18, nrow=3, ncol=6)
print(m)

     [,1] [,2] [,3] [,4] [,5] [,6]
[1,]    1    4    7   10   13   16
[2,]    2    5    8   11   14   17
[3,]    3    6    9   12   15   18

    Which of the following commands will extract the values 11 and 14?

A. m[2,4,2,5]

B. m[2:5]

C. m[4:5,2]

D. m[2,c(4,5)]

# DAY 2

_Add your name here_

Luke
Kristy
Mathilda
Alyssa
Charis
David
Nynke
Pengxing
Tharkeshi

# Create a GitHub account
www.github.com

# Setting up for the aRfternoon

1. Open RStudio
2. Run these commands
    * install.packages("ggplot2")
    * install.packages("knitr")
3. Download data
    * https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv

# Challenge

Create a new data.frame called gapminder_eurasia from the Gapminder data
* Only countries in Europe or Asia
* Only years after 1960
* Add new column called popMillions (divide pop by 1 million)

_Hints_
* Use comparisons: <, >, ==, !=, %in%
* Ue logical operators: & (AND), | (OR)
* Use $ to access columns
* Break it into steps:
    * Which countries are in Europe or Asia?
    * Select those rows from the data.frame
    * Which years are greater than 1960?
    * Select those rows from the data.frame

**Put answers down here v**

```
temp <- gapminder[gapminder$year > 1960,]
gapminder_Eurasia <- temp[(temp$continent == "Europe" | temp$continent == "Asia"),]
gapminder_Eurasia$popMillions <- gapminder_Eurasia$pop / (10^6)

gapminder.1960 <- gapminder[gapminder$year > 1960,]
Continents <- c("Europe", "Asia")
gapminder.1960.continents <- gapminder.1960[gapminder.1960$continent %in% Continents,]
gapminder.1960.continents$popMillions <- gapminder.1960.continents$pop / 1000000


temp1 <- gapminder[gapminder$continent %in% c("Europe","Asia"), ]
gapminder.part <- temp1[temp1$year > 1960, ]
gapminder.part$popMillions <- gapminder.part$pop/1e6


chal<-gapminder[gapminder$continent=="Asia"| gapminder$continent=="Europe",]
chaln<-chal[chal$year>1960,]
chaln$popMillions<-chaln$pop/1000000
chaln


gapminder_eurasia <- subset.data.frame(gapminder,continent %in% c("Asia","Europe"))
gapminder_eurasia <-subset.data.frame(gapminder_eurasia,year>1960)
gapminder_eurasia$popMillions <- gapminder_eurasia$pop / 1000000

gapminder_recent <- gapminder[gapminder$year > 1960, ]
gapminder_eurasia <- gapminder_recent[gapminder_recent$continent == c("Asia", "Europe"), ]
gapminder_eurasia$popMillions <- gapminder_eurasia$pop / 1000000

gapminder_eurasia <- gapminder[gapminder$continent %in% c("Asia", "Europe"),]
gapminder_eurasia <- gapminder_eurasia[gapminder_eurasia$year > 1960,]  
gapminder_eurasia$popMillions <- gapminder_eurasia$pop / 10^6 


x <- gapminder[gapminder$continent == c("Europe", "Asia"),
gapminder_eurasia <- x[x$year > 1960, ]
gapminder_eurasia$popMillions <- gapminder_eurasia$pop/1000000
```

```
#### From the tidyverse. 
#### Weird syntax - but looks kinda nice.
#### https://www.tidyverse.org/
gapmind_eurasia <- gapminder %>%
    dplyr::filter(Continent %in% c("Europe", "Asia")) %>%
    dplyr::filter(year > 1960) %>%
    dplyr::mutate(popmillions=pop/1000000)
####    
```

# Plotting

## Challenge 1

Modify the example
    * Make x axis = time
    * Make y axis = life expectancy
    * Colour points by continent

ggplot(gapminder, aes(year, lifeExp))+
  geom_point(aes(colour=continent))
  
## Challenge 2

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point(alpha = 0.5) +
    scale_x_log10() +
    geom_smooth(method = "lm", size = 1.5)

Change the shape of the points
Colour by continent
Add trendlines by continent

_Hint:_ Find the different shapes here 

ggplot(data = gapminder, aes(x= gdpPercap, y= lifeExp, colour=continent))+
    geom_point(alpha = 0.8)+
    scale_x_log10()+
    geom_smooth(method = "lm")+
    scale_shape(solid = T)
    
    
    ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, shape = continent, colour = continent)) + 
  geom_point(alpha = 0.5) + 
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 1.5)
    
# Challenge 3

Create a density plot of GDP per capita, filled by continent
Advanced:
    * Transform the x axis to show the spread
    * Add a facet layer by year
    * Make your own plot

# Solution

ggplot(data=gapminder, aes(x = gdpPercap, fill=continent)) + geom_density(alpha=0.6) + facet_wrap(~year) + scale_x_log10()


ggplot(data = gapminder, aes(x = gdpPercap, colour = continent, fill = continent)) +
  geom_density() + scale_x_log10() + facet_grid(year~.)


ggplot(data = gap.minder, aes(x = gdpPercap, colour = continent)) +
    geom_density()+
    scale_x_log10() +
    facet_wrap(~ year)

    
 ggplot(data = gap.minder, aes(x = gdpPercap, fill = continent)) +
    geom_density(alpha = 0.5, linetype= 0)+
    scale_x_log10() +
    facet_wrap(~ year)+
  labs(
    x = "GDP per capita",
    y = "Density",
    title = "Figure 1",
    colour = "Continent"
  )
