FROM jgomezdans/conda-base

LABEL maintainer="Philip Lewis <p.lewis@ucl.ac.uk>"
ENV GEOG0111_VERSION 0.0.1

USER $NB_USER

RUN git clone https://github.com/profLewis/geog0111-core.git
RUN mkdir -p $HOME/geog0111-core/notebooks/oneDrive

WORKDIR $HOME/geog0111-core/notebooks

# update conda packages
RUN conda update --all --yes 
RUN jupyter nbextension disable execute_time/ExecuteTime 


