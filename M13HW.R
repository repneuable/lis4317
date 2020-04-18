############################################################################
# ----- ------ ------ ----- MOD13: Animation in R ----- ------ ------ -----
############################################################################
#' ---
#' title:   "MOD13: Animation in R"
#' author:  "Kevin Hitt"
#' date:    "Due: April 20th, 2020"
#' ---

# Load packages
library(ggplot2)
library(gganimate)
library(ggthemes)

# Animation plot 1
plot_car <- ggplot(mtcars, aes(x = mpg, y = hp)) +
  geom_point(aes(color = as.factor(cyl), group = 1L)) +
  transition_states(cyl, 
                    transition_length = 2,
                    state_length = 1) +
  ease_aes("cubic-in-out") + 
  ggtitle("MPG vs. Horsepower",
          subtitle = "Now showing {closest_state} cylinders") +
  labs(fill="# of Cylinders") +
  theme_linedraw() 

# Animation plot 2
plot_iris <- ggplot(iris, aes(x = Petal.Width, y = Petal.Length)) +
  geom_point(aes(color = Species, group = 1L)) +
  transition_states(Species,
                    transition_length = 2,
                    state_length = 1) +
  ease_aes("cubic-in-out") +
  ggtitle("Petal Width vs. Petal Length", 
          subtitle = "Now showing {closest_state} species") +
  theme_linedraw()

# Export to GIF files
anim_save("car.gif", plot_car)
anim_save("iris.gif", plot_iris)
