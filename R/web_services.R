#library(httr)
#library(jsonlite)
#library(future)

baseApi <- "https://api.binance.com"
#' pingToServer
#'
#' @return Returns a data.frame as result.
#' @export
#'

pingToServer <- function() {
  endPoint <- "/api/v3/ping"
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  sc <- status_code(resValue)
  content <- content(resValue, "text")
  return(as.data.frame(content))
}

#' checkServerTime
#'
#' @return Returns a data.frame as result contains time of server.
#' @export
#'

checkServerTime <- function() {
  endPoint <- "/api/v3/time"
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  sc <- status_code(resValue)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}

#' fetchSymbolOrderBook
#'
#' @return Returns a data.frame as result contains order book details.
#' @export
#'

fetchSymbolOrderBook <- function(symbol, limit = 2) {
  stopifnot(is.character(symbol))
  stopifnot(is.numeric(limit))
  endPoint <- paste0("/api/v3/depth?symbol=", symbol, "&&limit=", limit)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}

#' fetchSymbolTrades
#'
#' @return Returns a data.frame as result contains symbol trades details.
#' @export
#'

fetchSymbolTrades <- function(symbol, limit) {
  stopifnot(is.character(symbol))
  stopifnot(is.numeric(limit))
  endPoint <- paste0("/api/v3/trades?symbol=", symbol,"&&limit=",limit)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}

#' fetchSymbolAggTrades
#'
#' @return Returns a data.frame as result contains symbol aggregate trades details.
#' @export
#'

fetchSymbolAggTrades <- function(symbol, limit) {
  stopifnot(is.character(symbol))
  stopifnot(is.numeric(limit))
  endPoint <- paste0("/api/v3/aggTrades?symbol=", symbol,"&&limit=",limit)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}

#' fetchSymbolAveragePrice
#'
#' @return Returns a data.frame as result contains symbol average price details.
#' @export
#'

fetchSymbolAveragePrice <- function(symbol) {
  stopifnot(is.character(symbol))
  endPoint <- paste0("/api/v3/avgPrice?symbol=", symbol)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}

#' fetchTicker24hPrice
#'
#' @return Returns a data.frame as result contains ticker 24 hours price details.
#' @export
#'

fetchTicker24hPrice <- function(symbol) {
  stopifnot(is.character(symbol))
  endPoint <- paste0("/api/v3/ticker/24hr?symbol=", symbol)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}

#' fetchTicker24hPrice
#'
#' @return Returns a data.frame as result contains ticker price details.
#' @export
#'

fetchTickerPrice <- function(symbol) {
  stopifnot(is.character(symbol))
  endPoint <- paste0("/api/v3/ticker/price?symbol=", symbol)
  getFutureRes <- future(GET(url = paste0(baseApi, endPoint)))
  resValue <- value(getFutureRes)
  content <- content(resValue, "text")
  return(as.data.frame(fromJSON(content)))
}

