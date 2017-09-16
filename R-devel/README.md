[![Build Status](https://travis-ci.org/rocker-org/rocker.svg?branch=master)](https://travis-ci.org/rocker-org/rocker)

# R-devel #

Derived in almost its entirety from https://github.com/rocker-org/rocker
## Overview ##

This repository contains Dockerfiles for different Docker containers of interest to R users. 

## Getting Started ##

To get started right away, ensure you have [Docker installed](https://docs.docker.com/installation/) and start a container with `docker run --rm -ti rocker/r-base` (see [here](https://docs.docker.com/engine/reference/run/) for the `docker run` command options). In this case we are starting the `r-base` container (the base package to build from) in an interactive mode, see below for details of the other containers currently available. To get started on the `rstudio` container or its derivative containers (eg. `hadleyverse` and `ropensci`) you need to open a port, see the [instructions in the wiki](https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image). The [wiki](https://github.com/rocker-org/rocker/wiki) also contains further instructions and information on the project, including how to extend these images and contribute to development.

## Status ##

This is work in progress; please read our [instructions to contributors](https://github.com/rocker-org/rocker/wiki/How-to-contribute) and talk to @eddelbuettel and @cboettig about how to get involved.

## Base Docker Containers ##


image            | description                               
---------------- | -----------------------------------------
[r-base](https://hub.docker.com/r/_/r-base)            |  Current R via apt-get with `debian:testing` & `unstable` repos  
[r-devel](https://hub.docker.com/r/rocker/r-devel)        |  R-devel added side-by-side onto r-base (using alias `RD`)      

## Use cases

The [rocker project](https://github.com/rocker-org/rocker) also hosts Docker images illustrating particular use cases. More information about these can be found in their respective repositories on [rocker-org](https://github.com/rocker-org)

## License ##

The Dockerfiles in this repository are licensed under the GPL 2 or later.

## Trademarks ##

RStudio is a registered trademark of RStudio, Inc.  The use of the trademarked term RStudio and the distribution of the RStudio binaries through the images hosted on [hub.docker.com](https://registry.hub.docker.com/) has been granted by explicit permission of RStudio.  Please review [RStudio's trademark use policy](http://www.rstudio.com/about/trademark/) and address inquiries about further distribution or other questions to [permissions@rstudio.com](emailto:permissions@rstudio.com).
