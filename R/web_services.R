library(httr)
#library(jsonlite)
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
  return(as.data.frame(fromJSON(content)))
}


checkServerTime <- function() {
  endPoint <- "/api/v3/time"
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  sc <- status_code(resValue)
  if (sc == 1) {

  }
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}


fetchSymbolExchangeInfo <- function(symbol) {
  endPoint <- paste0("/api/v3/exchangeInfo?symbol=", symbol)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}


fetchSymbolOrderBook <- function(symbol) {
  endPoint <- paste0("/api/v3/depth?symbol=", symbol)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}


fetchSymbolTrades <- function(symbol, limit) {
  endPoint <- paste0("/api/v3/trades?symbol=", symbol,"&&limit=",limit)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}


fetchSymbolAggTrades <- function(symbol, limit) {
  endPoint <- paste0("/api/v3/aggTrades?symbol=", symbol,"&&limit=",limit)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}


fetchSymbolCandleStick <- function(symbol, interval) {
  endPoint <- paste0("/api/v3/klines?symbol=", symbol,"&&interval=3m")
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  print(getFutureRes)
  resValue <- value(getFutureRes)
  print(resValue)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}


fetchSymbolAveragePrice <- function(symbol) {
  endPoint <- paste0("/api/v3/avgPrice?symbol=", symbol)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}

fetchTicker24hPrice <- function(symbol) {
  endPoint <- paste0("/api/v3/ticker/24hr?symbol=", symbol)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}


fetchTickerPrice <- function(symbol) {
  endPoint <- paste0("/api/v3/ticker/price?symbol=", symbol)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}

fetchTickerPrice(symbol = "BNBBTC")

