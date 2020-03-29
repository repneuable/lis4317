############################################################################
# ------ ------  MOD10: Time Series Trends and Visual Analysis ------ ------ 
############################################################################
#' ---
#' title:   "MOD10: Time Series Trends and Visual Analysis"
#' author:  "Kevin Hitt"
#' date:    "Due: March 30th, 2020"
#' ---

library(ggplot2)
library(gridExtra)

## Hot Dog Plot 1 (base R)
hotdogs <- read.csv("http://datasets.flowingdata.com/hot-dog-contest-winners.csv")
colors <- ifelse(hotdogs$New.record == 1, "darkred", "grey")

barplot(hotdogs$Dogs.eaten, 
        names.arg = hotdogs$Year, 
        col=colors, 
        border=NA,
        main = "Nathan's Hot Dog Eating Contest Results, 1980-2010",  
        xlab="Year", 
        ylab="Hot dogs and buns (HDBs) eaten")

## Hot Dog Plot 2 (ggplot2)
ggplot(hotdogs) +
  geom_bar(aes(x=Year, y=Dogs.eaten, fill=factor(New.record)), stat="identity") + 
  labs(title="Nathan's Hot Dog Eating Contest Results, 1980-2010", fill="New Record") + 
  xlab("Year") + 
  ylab("Hot dogs and buns (HDBs) eaten") +
  scale_fill_discrete(name="New Record",
                    labels=c("Record Remained", "Record Broken"))

## Hot Dog Plot 3 (ggplot2)
hotdog_places <- read.csv("http://datasets.flowingdata.com/hot-dog-places.csv",
                          sep = ",",
                          header = T)

hotdog_places <- as.matrix(hotdog_places)

#Rename the columns to correspond to the years 2000-2010
#instead of names(hotdog_places) <- c("2000", "2001", "2002", ... 
colnames(hotdog_places) <- lapply(2000:2010, as.character)

barplot(hotdog_places, 
        border=NA, 
        main="Hot Dog Eating Contest Results, 1980-2010", 
        xlab="Year", 
        ylab="Hot dogs and buns (HDBs) eaten")

## Economics Plot 1
data(economics)
force(economics)

# create function to create year column
year <- function(x) as.POSIXlt(x)$year + 1900
economics$year <- year(economics$date)

plot1 <- qplot(date, unemploy / pop, data = economics, geom = "line")
plot1 

## Economics Plot 2
plot2 <- qplot(date, uempmed, data = economics, geom = "line")
grid.arrange(plot1, plot2, ncol=2)

## Economics Plot 3
plot1 <- qplot(unemploy/pop, uempmed, data = economics, geom = c("point", "path"))
plot2 <- qplot(unemploy/pop, uempmed, data = economics, geom = c("point", "path"), color=year)
grid.arrange(plot1, plot2, ncol=2)

## Economics Plot 4
plot2

