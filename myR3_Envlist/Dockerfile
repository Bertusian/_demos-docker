# Every Dockerfile starts with a FROM, which describes what image we are building our image from.
FROM rocker/r-ver:4.0.3

MAINTAINER Hans Berten "hans.berten@azalma.be"

# RUN statements are commands which mimic command line commands
# create a directory in the container to receive our analysis
RUN mkdir /home/analysis

# copy csvscript (or dbiscript: see next 2 COPY) on the host to the directory in the container 
COPY csvscript.R /home/analysis/script.R
# COPY dbiscript.R /home/analysis/script.R
# COPY feestdagen.sql /home/analysis/feestdagen.sql

# the command to be run every time we'll launch the docker container
# here: go first to the directory /home/analysis & then run myscript.R
# mv stands for move the results saved in the analysis directory to the results directory
CMD cd /home/analysis \
  && R -e "source('script.R')" \
  && mv /home/analysis/p.csv /home/export/p.csv


