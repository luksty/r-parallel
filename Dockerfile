FROM r-base

## System libraries
RUN apt-get update \
    && apt-get install -y \
       libssl-dev libcurl4-openssl-dev libssh2-1-dev
RUN apt-get update \
    && apt-get install -y \
        linux-perf \
        linux-base \
    && rm -rf /var/lib/apt/lists/*
    
RUN install.r doParallel
RUN install.r data.table
RUN install.r prophet
RUN install.r forecast
RUN install.r foreach
RUN install.r doSNOW
RUN install.r doMC
