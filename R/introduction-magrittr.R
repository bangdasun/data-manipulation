#
# magrittr
# 
# from vignette('magrittr') and http://bradleyboehmke.github.io/tutorials/simplify_code
#

# some functions that manipulate data frame
head(mtcars)

# extract() - to subset
mtcars %>%
  extract(1:4, 1:4)

mtcars %>%
  extract(c('Mazda RX4'), c('mpg', 'cyl'))

# multiply_by() - transform - multiply
mtcars %>%
  extract(, 'mpg') %>%
  multiply_by(100)

# equals() - logical
mtcars %>%
  extract(, 'cyl')
  
# set_colnames() - rename
  

# %<>% - modify the data directly - can combine with mutate()
mtcars %<>%
  multiply_by(10)

# . as place holder for data (short hand)
mtcars %>%
  lm(mpg ~ cyl + hp, data = .) %>%
  summary()

# %T>% - (Tee) return the left-hand side value, not the result of right-hand side operation
rnorm(200) %>%
  matrix(ncol = 2) %>%
  plot %T>%
  colSums()

# %$% - (exposition) exposes the namse within the lhs to the rhs (short hand for with())
#   this operation is handy when functions don't themselves have a data argument
iris %>%
  subset(Sepal.Length > mean(Sepal.Length)) %$%
  cor(Sepal.Length, Sepal.Width)
