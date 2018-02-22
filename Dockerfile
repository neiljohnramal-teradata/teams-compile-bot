FROM python:3.6

LABEL maintainer="Neil John Ramal"

# Update the sources list
RUN apt-get update

# Install basic applications
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential

RUN git clone https://github.com/neiljohnramal-teradata/teams-compile-bot

WORKDIR /teams-compile-bot
RUN git submodule init
RUN git submodule update

RUN pip install -r requirements.txt

WORKDIR lib/ideone-api
RUN python setup.py install


