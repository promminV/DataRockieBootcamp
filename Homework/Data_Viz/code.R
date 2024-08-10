# Data Visualization
install.packages("ggpubr")

library(tidyverse)
library(ggpubr) # use for combine multiple graphs from ggplot

glimpse(diamonds)

# Price Dist.
ggplot(diamonds, aes(price)) +
  geom_histogram(bins=30, fill="darkgreen") +
  labs(title="Price Distribution", y="frequency")+
  theme_minimal() +
  theme(plot.title=element_text(hjust=0.5)) # align title to center

# Carat Dist.
ggplot(diamonds, aes(carat)) +
  geom_histogram(bins=30, fill="salmon") +
  labs(title="Carat Distribution", y="frequency")+
  theme_minimal() +
  theme(plot.title=element_text(hjust=0.5)) # align title to center

# Bar Chart: cutting/color of diamonds
ggplot(diamonds, aes(color, fill=cut)) +
  geom_bar() +
  labs(title="Type of cuts and colors of diamond", y="frequency") +
  theme_minimal() +
  theme(plot.title=element_text(hjust=0.5)) # align title to center


## relationship between x (length) vs. price
ggplot(diamonds %>% sample_frac(0.5), aes(x, price)) +
  geom_point()

## box plot (explore outliers in x)
ggplot(diamonds %>% sample_frac(0.5), aes(x)) +
  geom_boxplot(outlier.color="red")


# facet 
ggplot(diamonds %>% sample_n(5000), aes(x, price)) + 
  geom_point() +
  facet_wrap(~color, ncol=4) +
  labs(title="Length vs. Price by Color", x="length x [mm]") +
  geom_smooth() +
  theme_minimal() +
  theme(plot.title=element_text(hjust=0.5)) # align title to center
  
# filtering out outliers 
g1 <- ggplot(diamonds %>% filter(x>2.5) %>% sample_frac(0.5), aes(x, price)) +
  geom_point(aes(color = color), alpha=0.6) +
  theme_minimal() +
  geom_smooth(color="red") +
  xlab("length x [mm]") 

g2 <- ggplot(diamonds %>% filter(y>2 & y<11) %>% sample_frac(0.5), aes(y, price)) +
  geom_point(aes(color = color), alpha=0.6) +
  theme_minimal() +
  geom_smooth(color="green") +
  xlab("width y [mm]") 

g3<- ggplot(diamonds %>% filter(z>2 & z<9) %>% sample_frac(0.5), aes(z, price)) +
  geom_point(aes(color = color), alpha=0.6) +
  theme_minimal() +
  geom_smooth(color="blue") +
  xlab("depth z [mm]") 

# combine g1, g2, g3 
combine <- ggarrange(g1, g2, g3, nrow = 3, common.legend=TRUE, legend="right")

c2 <- annotate_figure(combine, top=text_grob("Price vs. Dimensions (mm)",
                face = "bold", size = 14))
