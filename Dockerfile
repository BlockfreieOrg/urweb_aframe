FROM ubuntu

RUN apt-get update -y
RUN apt-get install urweb build-essential -y
VOLUME ["/opt"]