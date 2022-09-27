library(httr)
library(jsonlite)
library(future)

baseApi <- "https://api.binance.com"


pingToServer <- function() {
  endPoint <- "/api/v3/ping"
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  sc <- status_code(resValue)
  if (sc == 1) {

  }
  content <- content(resValue, "text")
  return(as.data.frame(content))
}

pingToServer()

checkServerTime <- function() {
  endPoint <- "/api/v3/time"
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  sc <- status_code(resValue)
  if (sc == 1) {

  }
  content <- content(resValue, "text")
  return(as.data.frame(content))
}

checkServerTime()

fetchSymbolExchangeInfo <- function(symbol) {
  endPoint <- paste0("/api/v3/exchangeInfo?symbol=", symbol)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(content))
}

fetchSymbolExchangeInfo(symbol = "BNBBTC")

fetchSymbolOrderBook <- function(symbol) {
  endPoint <- paste0("/api/v3/depth?symbol=", symbol)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(content))
}

fetchSymbolOrderBook(symbol = "BNBBTC")

fetchSymbolTrades <- function(symbol) {
  endPoint <- paste0("/api/v3/trades?symbol=", symbol)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(content))
}

fetchSymbolTrades(symbol = "BNBBTC")



