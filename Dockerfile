## Emacs, make this -*- mode: sh; -*-
 
FROM rocker/r-base

MAINTAINER "Henrik Bengtsson" henrikb@braju.com

## System libraries
RUN apt-get update \
    && apt-get install -y \
       libopenmpi-dev \
       libzmq3-dev

## Legacy (snow is deprecated)
RUN install.r snow doSNOW 

## MPI
## RUN install.r Rmpi

## Random Number Generation (RNG)
RUN install.r rlecuyer

## The foreach ecosystem
RUN install.r foreach iterators
RUN install.r doParallel doMC doRNG

## The future ecosystem
RUN install.r future
RUN install.r future.apply
RUN install.r doFuture
RUN install.r future.callr
RUN install.r furrr

RUN install.r batchtools future.batchtools ## heavy set of dependencies
RUN install.r clustermq                    ## heavy set of dependencies
