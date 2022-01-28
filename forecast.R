library(fpp3)

dim(us_gasoline)
head(us_gasoline)

min(us_gasoline$Week)
max(us_gasoline$Week)
summary(us_gasoline$Barrels)

autoplot(us_gasoline)

fit <- us_gasoline %>%
  model(ARIMA(Barrels))

preds <- fit %>%
  forecast(h = "10 weeks")

preds %>%
  autoplot(us_gasoline)
