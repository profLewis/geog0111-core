FROM jgomezdans/uclgeog

LABEL maintainer="Philip Lewis <p.lewis@ucl.ac.uk>"

ENV GEOG0111_VERSION 0.0.1

# We should be NB_USER as inherited from uclgeog
USER $NB_USER

# Ensure we're in home folder (we're by virtue of parent image...)
WORKDIR $HOME 

RUN git clone https://github.com/profLewis/geog0111-core.git
RUN mkdir -p notebooks/oneDrive

WORKDIR $HOME/geog0111-core/notebooks

RUN jupyter nbextension disable execute_time/ExecuteTime 


