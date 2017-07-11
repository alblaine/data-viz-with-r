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

