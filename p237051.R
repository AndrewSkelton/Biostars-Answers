
# Set seed and make toy data
set.seed(666)
df <- data.frame(X = rnorm(20), Y = rnorm(20), Z = rnorm(20))

# Create plot using ggplot2
library(ggplot2)
gg <- ggplot(df) +
      geom_point(data = df, aes(x = X, y = Y), colour = "red") +
      geom_point(data = df, aes(x = X, y = Z), colour = "black") +
      theme_bw()
print(gg)