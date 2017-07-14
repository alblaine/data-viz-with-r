# run these two lines first to install and load the ggplot2 package:
install.packages("ggplot2")
library(ggplot2)
 
# 1. Learn more about the mpg dataset. Run the following code:

?mpg

# 2. Examine the first few rows of the mpg data set. Run the following code:

head(mpg)

# 3. Create a scatterplot with ggplot2, plotting engine displacement on the X-axis 
# and highway mileage on the Y-axis. Run:

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# 4. Create a scatterplot plotting the number of cylinders (cyl) as x and highway mileage (hwy) on the y-axis. 
# Type the code in the lines below. Run the code to test it!


# 5. Make a scatterplot of disp=x and hwy=y with class mapped to the color aesthetic. Run:

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# 6. Make the same scatterplot as the previous example, but map drv to color.
# Type the code in the lines below. Then run the code to test it.


# 7. Substitute another aesthetic in place of color (size, shape, or alpha). 
#Run the code:

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))

# 8. Facet_wrap() creates subplots. Run this code to see what faceting does:

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# 9. Practice Faceting. Substitute out class for another variable 
# in the dataset. Ex: trans, drive, or cyl. Run the code!

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# 10. Facet grids allow for an extra dimension of faceting. Run this code to see what facet_grid() does:

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(class ~ cyl)

# 11. Apply what you have learned! Create a chart with the diamonds data set using ggplot2.
# Get to know the dataset first using ?diamonds and head(diamonds) commands
# Decide on aesthetic mappings and whether you want to facet your chart.
# Type the code below:

?diamonds
head(diamonds)


# 12. Adding multiple layers to a graph. Run this code:

ggplot(data = diamonds) + 
  geom_point(mapping = aes(x = carat, y = price, color=cut)) +
  geom_smooth(mapping = aes(x = carat, y = price))


# 13. What is the difference between # 12 and this code? Run it to see:

ggplot(data = diamonds, mapping = aes(x = carat, y = price)) + 
  geom_point(aes(color=cut)) +
  geom_smooth()


# 14. Now use the shorthand method to make the following code more efficient: 

ggplot(data = diamonds) + 
  geom_point(mapping = aes(x = carat, y = price, color=clarity)) +
  geom_smooth(mapping = aes(x = carat, y = price))

# Type the shorthand version here:



# 15. Position adjustments. Run the following code to see the effect of alpha = 1/5 and position = "jitter"
ggplot(data =diamonds, mapping = aes(carat, price)) + 
  geom_point(mapping = aes(color=clarity, alpha=1/5), position="jitter") +
  geom_smooth()

# 16. Bar chart example. Run this example in the code to create a bar chart:

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut))


# 17. Now create a bar chart with x = clarity. 


