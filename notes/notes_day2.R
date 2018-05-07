# Setting up

# Download data

# https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv

gapminder <- read.csv("data/gapminder-FiveYearData.csv",
                      header = TRUE)
str(gapminder)
class(gapminder)
typeof(gapminder)
length(gapminder)
dim(gapminder)
head(gapminder)
tail(gapminder)

# Creating a data.frame

df <- data.frame(id = c("a", "b", "c"),
                 x = 1:3,
                 y = c(TRUE, TRUE, FALSE),
                 stringsAsFactors = FALSE)

# Subsetting a data.frame

## Extracting columns
df$id
df$x

## Subset using indices
df[1:2, 1:3]
df[1, ]
df[, 1]
df[1:2, "id"]
df[1:2, c("id", "y")]

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
bad_eurasia <- gapminder$continent == c("Europe", "Asia")

#     * Select those rows from the data.frame
gapminder_eurasia <- gapminder[is_eurasia, ]
# * Which years are greater than 1960?
gt_1960 <- gapminder_eurasia$year > 1960
table(gt_1960)
#     * Select those rows from the data.frame
gapminder_eurasia <- gapminder_eurasia[gt_1960, ]
head(gapminder_eurasia)
table(gapminder_eurasia$continent)
table(gapminder_eurasia$year)

gapminder_eurasia$popMillions <- gapminder_eurasia$pop / 1e6
head(gapminder_eurasia)

summary(gapminder_eurasia$popMillions)
summary(gapminder_eurasia)
median(gapminder_eurasia$popMillions)
sd(gapminder_eurasia$popMillions)
table(is.na(gapminder))

# Outputting data

write.table(gapminder_eurasia, file = "output/gapminder_eurasia.csv",
            sep = ",", quote = FALSE, row.names = FALSE)

# Plotting

hist(rnorm(10000))

library("ggplot2")

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point()

ggplot(data = gapminder)

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp))

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point()

# Challenge

ggplot(data = gapminder, aes(x = year, y = lifeExp, colour = continent)) +
    geom_point()

ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country)) +
    geom_line(aes(colour = continent)) +
    geom_point()

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, colour = continent)) +
    geom_point()

gapminder$logLifeExp <- log10(gapminder$lifeExp)

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point(alpha = 0.5) +
    scale_x_log10()

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point(alpha = 0.5) +
    scale_x_log10() +
    geom_smooth(method = "lm", size = 1.5)

# Challenge 2

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point(aes(colour = continent), alpha = 0.5, shape = 2) +
    scale_x_log10() +
    geom_smooth(method = "lm", size = 1.5, aes(colour = continent))


ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
    geom_point(aes(colour = continent), alpha = 0.5, shape = 2) +
    scale_x_log10() +
    geom_smooth(method = "lm", size = 1.5, aes(colour = continent)) +
    facet_wrap(~ continent)

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
