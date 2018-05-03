
[![Travis-CI Build
Status](https://travis-ci.org/hrbrmstr/fileio.svg?branch=master)](https://travis-ci.org/hrbrmstr/fileio)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/hrbrmstr/fileio?branch=master&svg=true)](https://ci.appveyor.com/project/hrbrmstr/fileio)
[![Coverage
Status](https://img.shields.io/codecov/c/github/hrbrmstr/fileio/master.svg)](https://codecov.io/github/hrbrmstr/fileio?branch=master)

# fileio

Post Files, Text or R Data to ‘file.io’

## Description

Post Files, Text or R Data to ‘file.io’.

## What’s Inside The Tin

The following functions are implemented:

  - `fi_data`: Post an R object to file.io
  - `fi_post`: Post a file to file.io
  - `fi_text`: Post text to file.io

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

    ## [1] '0.1.0'

### Post a file

``` r
fi_post(system.file("extdat", "tst.txt", package = "fileio"))
```

    ##   success    key                   link  expiry
    ## 1    TRUE YCICRF https://file.io/YCICRF 14 days

### Post text

``` r
fi_text("Hi Noam!")
```

    ##   success    key                   link  expiry
    ## 1    TRUE NqrRmT https://file.io/NqrRmT 14 days

### Post R data

``` r
fi_data(
  list(
    mtcars = mtcars,
    iris = iris,
    message = "Hi Noam!"
  )
)
```

    ##   success    key                   link  expiry                                              filename
    ## 1    TRUE fhz8wh https://file.io/fhz8wh 14 days ddea80f6-6b8b-4bf5-8ec4-2c4f57c73357154553c34b801.rds

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
