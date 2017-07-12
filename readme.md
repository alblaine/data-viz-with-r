# Data Visualization with R
Alison Blaine, Nushrat Khan & Heidi Tebbe  
7/11/2017  





## Workshop goals 

* learn about various packages for making data visualizations in R 
* be able to determine which package to use 
* understand basic syntax for the popular packages
* learn basic design principles for effective communication
* gain hands-on practice making different visualization types

## What is R?

R is a software environment for statistical computing and graphics. Using R you can do rigorous statistical analysis, clean and manipulate data, and create publication-quality graphics.

![](images/Plot_Mapping_All.png)

*clustering map*

## Popularity of R 

![](images/ieee.png)

Source: Stephen Cass, ["The 2016 Top Programming Langauges"](http://spectrum.ieee.org/computing/software/the-2016-top-programming-languages), IEEE Spectrum

## R packages 

Packages are programs that you import into R to help make tasks easier. The most popular R packages for working with data include *dplyr, stringr, tidyr, and ggplot2*. 

## How to find a package

There's no easy way (yet) for new R users to find R packages that they might need. People are working on this problem. In the meantime, consult the following list or ask a Librarian!

Resources include: 

* Google ("Top R packages for ....")
* Looking at trending R packages on [rdocumentation.org](https://www.rdocumentation.org/trends)

## Popular R packages for data viz 

* ggplot2
* ggvis
* htmlwidgets (for interactive web visualizations):
  * highcharter
  * leaflet
  * plotly
* shiny

## Core R functions for plotting

You can create graphs in R without installing a package, but packages will allow you to create better visualizations that are any of the following:

* attractive
* publication-quality
* interactive

## ggplot2

ggplot2 is the most popular visualization package for R. It's the best all-purpose package for creating many types of 2-dimensional visualizations. 

![](charts/animation.gif)

[Source: r-statistics.co](http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html)

## highcharter
highcharter is an R package known as an htmlwidget, which allows you to use popular Javascript packages for visualization in R. Free unless you are using it for a commercial or government purpose.


```r
data(citytemp)

hc <- highchart() %>% 
  hc_xAxis(categories = citytemp$month) %>% 
  hc_add_series(name = "Tokyo", data = citytemp$tokyo) %>% 
  hc_add_series(name = "London", data = citytemp$london) %>% 
  hc_add_series(name = "Other city",
                data = (citytemp$tokyo + citytemp$london)/2)

hc
```

![](images/highcharts.png)
  
## leaflet


```r
m <- leaflet(options = leafletOptions(zoomControl = FALSE, dragging=FALSE, minZoom = 15, maxZoom = 15)) %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=-78.6697, lat=35.7876,
    popup="Hello World!")
m  # Print the map
```
  
![](images/leaflet.png)

## plotly


```r
p <- plot_ly(economics, x = ~date, y = ~unemploy / pop)
p
```
![](images/plotly.png)

## Deciding on the right package

* static or interactive
* single viz or dashboard
* the nature of the data: geospatial? quantitative? qualitative? 
* purpose and licensing

#### Recommended packages

* 2D vizzes: **ggplot2** 
* 3D vizzes: **rgl** 
* maps: **leaflet**
* interactive: **ggvis, rbokeh, plotly, or highcharter**
* network graphs: **diagrammeR, visNetwork**
* web applications: **shiny**

## ggplot2: the most important package to learn first

**ggplot2** was created on the principles of the **Layered Grammar of Graphics** (2010), by Hadley Wickham and based of off work from Wilkinson, Anand, & Grossman (2005) and Jaques Bertin (1983). 

Essentially: graphs are like sentences you can construct, and they have a grammar. The grammar of graphics consists of the following: 

at least one layer: 

   + data & aesthetic mapping of the data to variables
   + a statistical transformation
   + geometric object (geom) -- point, line, bar, etc
   + position adjustment

scale   
coordinate system  
facet (optional)

*These components make up a graph.*

## Open script.R file

Download the following file: **[script.R](https://drive.google.com/open?id=0Bz7G_jKybSBsUXlzTGZoVlpYQlU)**
Click the blue download button  
Open RStudio. 
File > Open File...   
Select the **script.R** file that you just downloaded  (probably in your Downloads folder)
Click Open  

## Get to know the data
Let's see an example of a simple graph created with ggplot. We are going to use the **mpg** data set about different cars and their properties. 

#### Exercise #1: In your script file, run **?mpg** to learn more about this dataset. To run the code, highlight it and then click Run. (shortcut keys: Mac: command + Enter, Windows: CTRL + Enter)

#### Exercise #2: Run **head(mpg)** to see the first few rows of the data.


```r
head(mpg)
```

```
## # A tibble: 6 x 11
##   manufacturer model displ  year   cyl      trans   drv   cty   hwy    fl
##          <chr> <chr> <dbl> <int> <int>      <chr> <chr> <int> <int> <chr>
## 1         audi    a4   1.8  1999     4   auto(l5)     f    18    29     p
## 2         audi    a4   1.8  1999     4 manual(m5)     f    21    29     p
## 3         audi    a4   2.0  2008     4 manual(m6)     f    20    31     p
## 4         audi    a4   2.0  2008     4   auto(av)     f    21    30     p
## 5         audi    a4   2.8  1999     6   auto(l5)     f    16    26     p
## 6         audi    a4   2.8  1999     6 manual(m5)     f    18    26     p
## # ... with 1 more variables: class <chr>
```

## Exercise #3: ggplot syntax

The graph below uses ggplot2 to look for correlation between a car's engine displacement and highway mileage.

* `library(ggplot2)`: loads the ggplot2 library

* `ggplot()` : function that tells R that you want to make a graph with ggplot

* `data = mpg` : says that you want to use the mpg dataset (sample data that comes with R)

* `geom_point()`: function that says you want to make a scatterplot

* `mapping = aes()`: function that allows you to map data variables to X and Y axes

**Run the following code in your script file:**

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
```

![](readme_files/figure-html/unnamed-chunk-6-1.png)<!-- -->


## Exercise #4: Practice
Make a scatterplot with `cyl` mapped to the x-axis and `hwy` mapped to the y-axis.

![](readme_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

## Solution to #4

```r
ggplot(data= mpg) + geom_point(mapping = aes(x=cyl, y=hwy))
```

## Exercise #5: Mapping a variable to color

Make a scatterplot of `disp`=x and `hwy`=y with class mapped to the `color` aesthetic. Run:

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
```

![](readme_files/figure-html/unnamed-chunk-9-1.png)<!-- -->

## Exercise #6: Make the same scatterplot as the previous example, but map drv to color.
![](readme_files/figure-html/unnamed-chunk-10-1.png)<!-- -->

## Solution to #6
The type of drive system the car has (4-wheel, rear-wheel, and front-wheel) is mapped to color.

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))
```

## Exercise #7: Aesthetic parameters

Variables can be mapped to the following aesthetic parameters. If you are publishing in b/w, and can't use color, you might want to use size or shape:

* `color`
* `size`
* `shape`
* `alpha` - transparency

**Substitute another aesthetic in place of `color`. Run the code:**

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))
```

## Exercise #8: Faceting

Facets are a way to create multiple smaller charts, or subplots, based on a variable. Run this code to see what faceting does:

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
```

![](readme_files/figure-html/unnamed-chunk-13-1.png)<!-- -->

## Exercise #9: Practice Faceting. 

**Substitute `class` for another variable in the dataset. Ex: `trans`, `drive`, or `cyl`**

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
```

## Exercise 10: facet_grid

Facet grids allow for an extra dimension of faceting. Run this code in your script to see what facet_grid() does:

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
```

![](readme_files/figure-html/unnamed-chunk-15-1.png)<!-- -->

## Apply what you have learned

Now create a new scatter plot with the dataset `diamonds` using ggplot2. Refer to previous code examples for assistance.


```r
head(diamonds)
```

```
## # A tibble: 6 x 10
##   carat       cut color clarity depth table price     x     y     z
##   <dbl>     <ord> <ord>   <ord> <dbl> <dbl> <int> <dbl> <dbl> <dbl>
## 1  0.23     Ideal     E     SI2  61.5    55   326  3.95  3.98  2.43
## 2  0.21   Premium     E     SI1  59.8    61   326  3.89  3.84  2.31
## 3  0.23      Good     E     VS1  56.9    65   327  4.05  4.07  2.31
## 4  0.29   Premium     I     VS2  62.4    58   334  4.20  4.23  2.63
## 5  0.31      Good     J     SI2  63.3    58   335  4.34  4.35  2.75
## 6  0.24 Very Good     J    VVS2  62.8    57   336  3.94  3.96  2.48
```


## Example: 


```r
ggplot(data = diamonds) + 
  geom_point(mapping = aes(x = carat, y = price, color=cut)) + facet_wrap(~cut, nrow=2)
```

![](readme_files/figure-html/unnamed-chunk-17-1.png)<!-- -->

