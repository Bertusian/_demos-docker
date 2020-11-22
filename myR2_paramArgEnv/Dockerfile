# Every Dockerfile starts with a FROM, which describes what image we are building our image from.
FROM rocker/r-ver:4.0.3

ARG SCRIPT=iris
ENV SCRIPT ${SCRIPT}

# the command to be run every time we'll launch the docker container
# here: go first to the directory /home/analysis & then run mcript.R
# mv stands for move the results saved in the analysis directory to the results directory
CMD cd /home/analysis \
  && R -e "source('${SCRIPT}.R')"
 

