# Every Dockerfile starts with a FROM, which describes what image we are building our image from.
FROM hberten/r-base:4.0.3

RUN mkdir /home/analysis

COPY csvscript.R /home/analysis/script.R

# the command to be run every time we'll launch the docker container
# here: go first to the directory /home/analysis & then run mcript.R
# mv stands for move the results saved in the analysis directory to the results directory
CMD cd /home/analysis \
  && R -e "source('script.R')" \
  && mv /home/analysis/p.csv /home/export/p.csv


