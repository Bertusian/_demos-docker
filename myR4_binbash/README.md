Create A Docker image based on rocker/r-ver:4.0.3 and bin/bash as CMD
```
FROM rocker/r-ver:4.0.3
#RUN useradd -ms /bin/bash airflow
#USER airflow
#WORKDIR /home/airflow/analysis
CMD ["/bin/bash"]
```

Build the image
```
docker build -t hberten/r-ver:4.0.3 .
```

Enter a running container and mount a folder
```
docker run --rm -it -v /home/hans/_demos/docker/myR4_binbash/:/home/analysis hberten/r-ver:4.0.3
```

Once in the container enter:
```
Rscript /home/analysis/cars.R -d
```

