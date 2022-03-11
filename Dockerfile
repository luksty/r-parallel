FROM rocker/r-base:3.6.3

## System libraries
RUN apt-get update \
    && apt-get install -y \
       libssl-dev libcurl4-openssl-dev libssh2-1-dev


ENV RENV_VERSION 0.15.3
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

RUN mkdir /R
WORKDIR /R
COPY /data/R/renv.lock /R/renv.lock
RUN R -e 'renv::restore()'
