# Setting up

# Open your project
# Run install.packages("ggplot2")
# Download data, save in the data folder

# https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv

gapminder <- read.csv("data/gapminder-FiveYearData.csv",
                      header = TRUE)

# What does the data look like?

str(gapminder)
class(gapminder)
typeof(gapminder)
length(gapminder)
dim(gapminder)
head(gapminder)
tail(gapminder)

# data.frames

# Special kind of list
# Each item is a vector of the same type
# Usually think of it as a table, where each column has a different type

# Creating a data.frame

df <- data.frame(id = c("a", "b", "c"),
                 x = 1:3,
                 y = c(TRUE, TRUE, FALSE),
                 stringsAsFactors = FALSE)

# Subsetting a data.frame

## Extracting columns, like a list
df$id
df$x

## Subset using indices
df[1:2, 1:3]
df[1, ]
df[, 1]
df[1:2, "id"]
df[1:2, c("id", "y")]

## Look at individual columns

colnames(gapminder)
typeof(gapminder$country)
typeof(gapminder$pop)
str(gapminder)

# Creating new columns

gapminder$gdpTotal <- gapminder$gdpPercap * gapminder$pop
head(gapminder)

# Challenge

# Create a new data.frame called gapminder_eurasia from the Gapminder data
# * Only countries in Europe or Asia
# * Only years after 1960
# * Add new column called popMillions (divide pop by 1 million)

# _Hints_
# * Use comparisons: <, >, ==, !=, %in%
# * Use logical operators: & (AND), | (OR)
# * Use $ to access columns
# * Break it into steps:
#     * Which countries are in Europe or Asia?

is_eurasia <- gapminder$continent == "Europe" |
    gapminder$continent == "Asia"
is_eurasia <- gapminder$continent %in% c("Europe", "Asia")
table(is_eurasia)

# Problem 1
# This doesn't work because the vector is recycled
# Use %in% instead
bad_eurasia <- gapminder$continent == c("Europe", "Asia")

#     * Select those rows from the data.frame
gapminder_eurasia <- gapminder[is_eurasia, ]
# * Which years are greater than 1960?
#
## Remember to use the data.frame that has already been filtered
gt_1960 <- gapminder_eurasia$year > 1960
table(gt_1960)
#     * Select those rows from the data.frame
gapminder_eurasia <- gapminder_eurasia[gt_1960, ]
head(gapminder_eurasia)
table(gapminder_eurasia$continent)
table(gapminder_eurasia$year)

#  * Create the new column
gapminder_eurasia$popMillions <- gapminder_eurasia$pop / 1e6
head(gapminder_eurasia)

## Use these functions to explore continuous data
summary(gapminder_eurasia$popMillions)
summary(gapminder_eurasia)
median(gapminder_eurasia$popMillions)
sd(gapminder_eurasia$popMillions)
table(is.na(gapminder))

# Outputting data

write.table(gapminder_eurasia, file = "output/gapminder_eurasia.csv",
            sep = ",", quote = FALSE, row.names = FALSE)

## Could also use the write.csv function as a shortcut

# Plotting

# Here is an example of a base R plot
hist(rnorm(10000))


# We are going to use the ggplot2 library because:
#   * It can produce prettier plots with less effort
#   * It has lots of useful built in features
#   * It's a good example of using a package to add functionality to R
library("ggplot2")

# Here is an example ggplot command
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point()

# Let's break it down

## Tell ggplot which data we want to use
ggplot(data = gapminder)

## Set aesthetics to tell which columns in our data we want to use as different
## aspects of the plot
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp))

## Use the + operator to add layers, here we want points to get a scatter plot
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point()

# Challenge
#
# Modify the example
#   * Make x axis = time
#   * Make y axis = life expectancy
#   * Colour points by continent

ggplot(data = gapminder, aes(x = year, y = lifeExp, colour = continent)) +
    geom_point()


# We can add multiple geometries
# If we define an aesthetic inside a geometry it only applies to that layer
ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country)) +
    geom_line(aes(colour = continent)) +
    geom_point()


# Our first plot has quite a large range of values
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, colour = continent)) +
    geom_point()

# One way to make it easier to see is to calculate the log and plot that
gapminder$logLifeExp <- log10(gapminder$lifeExp)

# Or we can just ask ggplot to scale the axis for us!
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point(alpha = 0.5) +
    scale_x_log10()

# Even better we can fit a linear model to see the trend!
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point(alpha = 0.5) +
    scale_x_log10() +
    geom_smooth(method = "lm", size = 1.5)

# Challenge 2

# Change the shape of the points
# Colour by continent
# Add trendlines by continent


ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point(aes(colour = continent), alpha = 0.5, shape = 2) +
    scale_x_log10() +
    geom_smooth(method = "lm", size = 1.5, aes(colour = continent))

# Sometimes we want to split up a plot into different groups
# This is easy to do using facets
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point(aes(colour = continent), alpha = 0.5, shape = 2) +
    scale_x_log10() +
    geom_smooth(method = "lm", size = 1.5, aes(colour = continent)) +
    facet_wrap(~ continent)

# To make our plot easier to understand we can add labels
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point(aes(colour = continent), alpha = 0.5, shape = 2) +
    scale_x_log10() +
    geom_smooth(method = "lm", size = 1.5, aes(colour = continent)) +
    facet_wrap(~ continent) +
    labs(
        x = "GDP per capita",
        y = "Life expectency",
        title = "Figure 1",
        colour = "Continent"
    )

# We can also adjust the appearance of our plot using themes
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point(aes(colour = continent), alpha = 0.5, shape = 2) +
    scale_x_log10() +
    geom_smooth(method = "lm", size = 1.5, aes(colour = continent)) +
    facet_wrap(~ continent) +
    labs(
        x = "GDP per capita",
        y = "Life expectency",
        title = "Figure 1",
        colour = "Continent"
    ) +
    theme_minimal() +
    theme(
        legend.position = "none",
        axis.title = element_text(size = 15),
        plot.title = element_text(size = 20)
    )
