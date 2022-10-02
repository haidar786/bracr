#' pingToServer
#' @return Returns a data.frame as result.
#' @import httr
#' @import future
#' @import jsonlite
#' @export
#'
baseApi <- "https://api.binance.com"
pingToServer <- function() {
  endPoint <- "/api/v3/ping"
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(content))
}

checkServerTime <- function() {
  endPoint <- "/api/v3/time"
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}


fetchSymbolOrderBook <- function(symbol, limit = 2) {
  stopifnot(is.character(symbol))
  stopifnot(is.numeric(limit))
  endPoint <- paste0("/api/v3/depth?symbol=", symbol, "&&limit=", limit)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}



fetchSymbolTrades <- function(symbol, limit) {
  stopifnot(is.character(symbol))
  stopifnot(is.numeric(limit))
  endPoint <- paste0("/api/v3/trades?symbol=", symbol,"&&limit=",limit)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}



fetchSymbolAggTrades <- function(symbol, limit) {
  stopifnot(is.character(symbol))
  stopifnot(is.numeric(limit))
  endPoint <- paste0("/api/v3/aggTrades?symbol=", symbol,"&&limit=",limit)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}



fetchSymbolAveragePrice <- function(symbol) {
  stopifnot(is.character(symbol))
  endPoint <- paste0("/api/v3/avgPrice?symbol=", symbol)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}



fetchTicker24hPrice <- function(symbol) {
  stopifnot(is.character(symbol))
  endPoint <- paste0("/api/v3/ticker/24hr?symbol=", symbol)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}




fetchTickerPrice <- function(symbol) {
  stopifnot(is.character(symbol))
  endPoint <- paste0("/api/v3/ticker/price?symbol=", symbol)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}

