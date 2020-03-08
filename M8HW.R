############################################################################
# ------ ------ --- --- Mod8: Correlation & Regression --- --- ------ ------ 
############################################################################
#' ---
#' title:   "Mod8: Correlation & Regression"
#' author:  "Kevin Hitt"
#' date:    "Due: March 8th, 2020"
#' ---

# Load packages
data(mtcars)
library(corrgram)
library(ggcorrplot)
library(ggplot2)
library(reshape2)
library(GGally)
library(ggExtra)

############################################################################

# corrgram
corrgram(mtcars, order=T, 
         lower.panel=panel.ellipse,
         upper.panel=panel.pts, 
         text.panel=panel.txt,
         diag.panel=panel.minmax,
         main="Correlogram of Car Mileage Data (corrgram)")

# minified version
#   top right (x=cyl, y=mpg)
#   bottom left (x=mpg, y=cyl)
corrgram(mtcars[,1:3], order=T, 
         lower.panel=panel.ellipse,
         upper.panel=panel.pts, 
         text.panel=panel.txt,
         diag.panel=panel.minmax,
         main="Correlogram of Car Mileage Data Subset (corrgram)")

# ggplot2
qplot(x=Var1, y=Var2, data=melt(cor(mtcars)), fill=value, geom="tile",
      main="Heatmap of Car Mileage Data (qplot)")

#ggcorrplot #1
ggcorrplot(cor(mtcars), hc.order = TRUE, type = "upper",
           outline.col = "white",
           title="Correlogram of Car Mileage Data (ggcorrplot)")

#ggcorrplot #2
ggcorrplot(cor(mtcars), method = "circle",
           title="Correlogram of Car Mileage Data (ggcorrplot)")

#ggcorrplot #3
ggcorrplot(cor(mtcars), hc.order = TRUE, type = "lower",
           outline.col = "white",
           ggtheme = ggplot2::theme_gray,
           colors = c("#6D9EC1", "white", "#E46726"),
           lab = T,
           title="Correlogram of Car Mileage Data (ggcorrplot)")

#GGally #1
ggcorr(cor(mtcars), palette = "Set3", label = TRUE) +
  labs(title="GGally Correlogram (ggcorr)")

#GGally #2
ggpairs(mtcars)

#GGally #3
ggpairs(mtcars[,1:3])

#ggExtra Marginal Plot
g <- ggplot(mtcars, aes(hp, mpg)) + 
  geom_count(show.legend = F) + 
  geom_smooth(method="lm", se=F) +
  ggtitle("Relationship of HP vs. MPG with Marginal Plot")

ggMarginal(g, type = "histogram", fill="transparent")
ggMarginal(g, type = "density", fill="transparent") 

