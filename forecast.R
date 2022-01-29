library(fpp3)

dim(us_gasoline)
head(us_gasoline)

min(us_gasoline$Week)
max(us_gasoline$Week)
summary(us_gasoline$Barrels)

autoplot(us_gasoline)

fit <- us_gasoline %>%
  model(ARIMA(Barrels))

# Only forecast 26 weeks
preds <- fit %>%
  forecast(h = 26)

# Only plot historicals after 2015
us_gas_post_2000 <- us_gasoline %>%
  filter_index("2015" ~ .)

preds %>%
  autoplot(us_gas_post_2000) +
  labs(
    title = "US Gas Forecast",
    level = "Level"
  )
