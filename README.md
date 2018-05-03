
# fileio

Post Files to ‘file.io’

## Description

Post Files to ‘file.io’\!

## What’s Inside The Tin

The following functions are implemented:

  - `fi_post`: Post a file\!

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

``` r
fi_post(system.file("extdat", "tst.txt", package = "fileio"))
```

    ##   success    key                   link  expiry
    ## 1    TRUE 2WMICq https://file.io/2WMICq 14 days
