
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
    ## 1    TRUE JLmMCb https://file.io/JLmMCb 14 days

### Post text

``` r
fi_text("Hi Noam!")
```

    ##   success    key                   link  expiry
    ## 1    TRUE L3KlLl https://file.io/L3KlLl 14 days

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
    ## 1    TRUE QDMCj6 https://file.io/QDMCj6 14 days d05b2d68-b2c7-47c4-8869-50328f70fe1f152ed2b346351.rds
