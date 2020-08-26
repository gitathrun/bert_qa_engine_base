FROM mcr.microsoft.com/oryx/python:3.7-20190712.5
LABEL maintainer="teng.fu@teleware.com"


#Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    && pip install --upgrade pip \
    && pip install ktrain 

WORKDIR /tmp

# download model script
COPY download_models.py .
RUN python download_models.py

# check models
RUN ls ~/.cache/torch/transformers

