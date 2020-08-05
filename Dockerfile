FROM jgomezdans/conda-base

LABEL maintainer="Philip Lewis <p.lewis@ucl.ac.uk>"
ENV GEOG0111_VERSION 0.0.1


USER root
RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
    git \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

USER $NB_USER

RUN git clone https://github.com/profLewis/geog0111-core.git

WORKDIR $HOME/geog0111-core/notebooks

# update conda packages
RUN conda update --all --yes 
RUN jupyter nbextension disable execute_time/ExecuteTime 


