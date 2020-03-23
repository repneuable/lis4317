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


# 5 Principles of Design
# (1) Alignment
#  The purpose of alignment is to create order and organisation among elements.
#  I believe this was achieved in this plot with the mirroring of the title and
#  logo, as well as the centering of the axis titles and legends. 

# (2) Repitition
# Repition is used to create association and consistency between elements. This
# was achieved here with the consistency of the color palette and smoothing method.
# The opportunity to use repitition is greater when considering a portfolio of plots. 

# (3) Contrast
# Constrast is achieved here with the size of the Girth variable and brightness of the
# smoothing line.

# (4) Proximity
# Proximity means that elements are visually connected in some way. This is achieved 
# by grouping the legends and placing the title and logo on opposite corners. 

# (5) Balance
# Balance brings stabilization and structure to the plot with the mirroring of the 
# logo and title and centering of the axis labels. Symmetry is difficulty to introduce
# without altering the form of the graph. 


