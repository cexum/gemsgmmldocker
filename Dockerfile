# syntax=docker/dockerfile:1
FROM python:3.7.5-buster
# tzdata is automatically fetched by apt-get and we have to deal /w it else hang the shell
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update 
RUN apt-get install -y git g++ openssl swig libboost-all-dev make qt5-default
RUN apt-get install -y python

RUN useradd -ms /bin/bash gemsuser
COPY . /home/gemsuser

ENV PROGRAMS=/programs
ENV GEMSHOME=/programs/gems
ENV GMMLHOME=/programs/gems/gmml
ENV PYTHON_HOME=/usr/include/python3.7m
WORKDIR $PROGRAMS
RUN git clone https://github.com/GLYCAM-Web/gems.git 
WORKDIR $GEMSHOME
RUN git clone https://github.com/GLYCAM-Web/gmml.git 
RUN chown gemsuser -R $PROGRAMS
USER gemsuser
RUN ./make.sh

CMD [ "/bin/bash" ]
