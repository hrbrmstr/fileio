
[![Travis-CI Build
Status](https://travis-ci.org/hrbrmstr/fileio.svg?branch=master)](https://travis-ci.org/hrbrmstr/fileio)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/hrbrmstr/fileio?branch=master&svg=true)](https://ci.appveyor.com/project/hrbrmstr/fileio)
[![Coverage
Status](https://img.shields.io/codecov/c/github/hrbrmstr/fileio/master.svg)](https://codecov.io/github/hrbrmstr/fileio?branch=master)

# fileio

Ephemeral File, Text or R Data Sharing with ‘file.io’

## Description

The ‘file.io’ \<file.io\> service enables ephemeral, convenient and
anonymous file sharing. Methods are provided to upload existing files, R
data objects or text messages to this service.

## What’s Inside The Tin

The following functions are implemented:

  - `fi_post_file`: Post a file to file.io
  - `fi_post_rdata`: Post an R object to file.io
  - `fi_post_text`: Post text to file.io

## Installation

``` r
devtools::install_github("hrbrmstr/fileio")
```

## Usage

``` r
library(fileio)

# current verison
packageVersion("fileio")
```

    ## [1] '0.2.0'

### Post a file

``` r
(x <- fi_post_file(system.file("extdat", "tst.txt", package = "fileio")))
```

    ##   success    key                   link  expiry
    ## 1    TRUE ouNU6O https://file.io/ouNU6O 14 days

``` r
readLines(con <- url(x$link), warn = FALSE)
```

    ## [1] "Hi Noam!"

``` r
close(con)
```

### Post text

``` r
(x <- fi_post_text("Hi Noam!", "2d"))
```

    ##   success    key                   link  expiry
    ## 1    TRUE lWCpV2 https://file.io/lWCpV2 14 days

``` r
readLines(con <- url(x$link), warn = FALSE)
```

    ## [1] "Hi Noam!"

``` r
close(con)
```

### Post R data

``` r
fi_post_rdata(
  list(
    mtcars = mtcars,
    iris = iris,
    message = "Hi Noam!"
  )
) -> x

str(
  readRDS(con <- url(x$link)), 
  1
)
```

    ## List of 3
    ##  $ mtcars :'data.frame': 32 obs. of  11 variables:
    ##  $ iris   :'data.frame': 150 obs. of  5 variables:
    ##  $ message: chr "Hi Noam!"

``` r
close(con)
```

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
