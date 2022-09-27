library(httr)
library(jsonlite)
library(future)

baseApi <- "https://api.binance.com"

pingToBinanceApi <- function() {
  endPoint <- "/api/v3/ping"
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  status_code(resValue)
  content <- content(resValue, "text")
  return(as.data.frame(content))
}
pingToBinanceApi()


