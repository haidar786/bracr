library(testthat)
library(httr)
library(jsonlite)
library(future)

#input test

testthat::test_that("User input wrong symbol in fetchSymbolOrderBook()", {
  expect_error(fetchSymbolOrderBook(ggg124))
  expect_error(fetchSymbolOrderBook(5454454))
  expect_error(fetchSymbolOrderBook(abcdef))
  expect_error(fetchSymbolOrderBook(R%%5))
})

testthat::test_that("User input wrong symbol or limit in fetchSymbolTrades()", {
  expect_error(fetchSymbolTrades(ggg124, 5))
  expect_error(fetchSymbolTrades(5454454, 5))
  expect_error(fetchSymbolTrades(abcdef, 5))
  expect_error(fetchSymbolTrades(R%%5, 5))
  expect_error(fetchSymbolTrades(5, 5))
  expect_error(fetchSymbolTrades("BNBBTC", "qwerty"))
  expect_error(fetchSymbolTrades("BNBBTC", d6))
  expect_error(fetchSymbolTrades("BNBBTC", R%%5))
  expect_error(fetchSymbolTrades("BNBBTC", abcde))
})

testthat::test_that("User input wrong symbol or limit in fetchSymbolAggTrades()", {
  expect_error(fetchSymbolAggTrades(ggg124, 5))
  expect_error(fetchSymbolAggTrades(5454454, 5))
  expect_error(fetchSymbolAggTrades(abcdef, 5))
  expect_error(fetchSymbolAggTrades(R%%5, 5))
  expect_error(fetchSymbolAggTrades(5, 5))
  expect_error(fetchSymbolAggTrades("BNBBTC", "qwerty"))
  expect_error(fetchSymbolAggTrades("BNBBTC", d6))
  expect_error(fetchSymbolAggTrades("BNBBTC", R%%5))
  expect_error(fetchSymbolAggTrades("BNBBTC", abcde))
})

testthat::test_that("User input wrong symbol or interval in fetchSymbolCandleStick()", {
  expect_error(fetchSymbolCandleStick(ggg124, "3m"))
  expect_error(fetchSymbolCandleStick(5454454, "3m"))
  expect_error(fetchSymbolCandleStick(abcdef, "3m"))
  expect_error(fetchSymbolCandleStick(R%%5, "3m"))
  expect_error(fetchSymbolCandleStick(5, 5))
  expect_error(fetchSymbolCandleStick("BNBBTC", ggg124))
  expect_error(fetchSymbolCandleStick("BNBBTC", 5454454))
  expect_error(fetchSymbolCandleStick("BNBBTC", abcdef))
  expect_error(fetchSymbolCandleStick("BNBBTC", R%%5))
})

testthat::test_that("User input wrong symbol in fetchSymbolAveragePrice()", {
  expect_error(fetchSymbolAveragePrice(ggg124))
  expect_error(fetchSymbolAveragePrice(5454454))
  expect_error(fetchSymbolAveragePrice(abcdef))
  expect_error(fetchSymbolAveragePrice(R%%5))
})

testthat::test_that("User input wrong symbol in fetchTicker24hPrice()", {
  expect_error(fetchTicker24hPrice(ggg124))
  expect_error(fetchTicker24hPrice(5454454))
  expect_error(fetchTicker24hPrice(abcdef))
  expect_error(fetchTicker24hPrice(R%%5))
})

testthat::test_that("User input wrong symbol in fetchTickerPrice()", {
  expect_error(fetchTickerPrice(ggg124))
  expect_error(fetchTickerPrice(5454454))
  expect_error(fetchTickerPrice(abcdef))
  expect_error(fetchTickerPrice(R%%5))
})

# output test

testthat::test_that("pingToServer() function is working", {
  df = pingToServer()
  expect_true(is.data.frame(df))
})

testthat::test_that("checkServerTime() function is working", {
  df = checkServerTime()
  expect_true(is.data.frame(df))
})

testthat::test_that("fetchSymbolOrderBook() function is working", {
  df = fetchSymbolOrderBook("BNBBTC")
  expect_true(is.data.frame(df))
})

testthat::test_that("fetchSymbolTrades() function is working", {
  df = fetchSymbolTrades("BNBBTC", 5)
  expect_true(is.data.frame(df))
})

testthat::test_that("fetchSymbolAggTrades() function is working", {
  df = fetchSymbolAggTrades("BNBBTC", 5)
  expect_true(is.data.frame(df))
})

testthat::test_that("fetchSymbolAveragePrice() function is working", {
  df = fetchSymbolAveragePrice("BNBBTC")
  expect_true(is.data.frame(df))
})

testthat::test_that("fetchTicker24hPrice() function is working", {
  df = fetchTicker24hPrice("BNBBTC")
  expect_true(is.data.frame(df))
})

testthat::test_that("fetchTickerPrice() function is working", {
  df = fetchTickerPrice("BNBBTC")
  expect_true(is.data.frame(df))
})

# Downloading a big query



testthat::test_that("fetchSymbolTrades() function is working", {
  df = fetchSymbolTrades("BNBBTC", 5000)
  #print(df)
  expect_true(is.data.frame(df))
})

testthat::test_that("fetchSymbolAggTrades() function is working", {
  df = fetchSymbolAggTrades("BNBBTC", 5000)
  #print(df)
  expect_true(is.data.frame(df))
})

