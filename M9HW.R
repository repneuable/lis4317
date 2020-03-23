############################################################################
# ------ ------ ----  MOD9: Visual Multivariate Analysis  ---- ------ ------ 
############################################################################
#' ---
#' title:   "MOD9: Visual Multivariate Analysis"
#' author:  "Kevin Hitt"
#' date:    "Due: March 23rd, 2020"
#' ---

#Load packages
library(ggplot2)
library(magick)

#Load data
# credit: https://vincentarelbundock.github.io/Rdatasets/datasets.html
# title:  Girth, Height and Volume for Black Cherry Trees
trees <- read.csv("trees.csv")

#Inspect data
str(trees)
head(trees)

#Multivariate visualization
plot <- ggplot(trees, aes(x=Volume, y=Height, size=Girth, color=Girth)) +
  geom_point() +
  geom_smooth(method="lm", formula="y ~ x") +
  theme_minimal() +
  ggtitle("Black Cherry Tree Volume vs. Height") + 
  theme(plot.margin = unit(c(0.5, 0.5, 3.0, 0.5), "lines"),
        plot.background = element_rect("gray98"))

#Load plot image and logo image for layering
logo <- image_read("logo.png") %>% 
  image_resize(90)
plot_img <- image_read("cherry.png")

plot_img %>%
  image_composite(logo, offset="+594+366")


