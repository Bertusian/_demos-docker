Build app with a mounted volume for all app code & building stuff (no code copied at buildtime with Dockerfile)!!
```
docker build -t hberten/mydocker --build-arg SCRIPT=iris .
```
Test ARG dat doorgegeven is naar ENV in de container
```
docker run hberten/mydocker env
```

Run app container en pick de export in via mounted volume
Run app container via bin/bash en test de code in de container zelf
```
docker run --rm -it -v ~/_demos/myR2_paramArgEnv/:/home/analysis hberten/mydocker:latest /bin/bash
cd /home/analysis && ls
```

Run container zonder ENV (default ARG wordt dus gekozen)
```
docker run -v ~/_demos/myR2_paramArgEnv/:/home/analysis hberten/mydocker:latest
```

Run container mét ENV (default ARG wordt overschreven)
```
docker run -v ~/_demos/myR2_paramArgEnv/:/home/analysis -e SCRIPT=cars hberten/mydocker:latest
```
Test ENV in container
```
docker run --rm -e SCRIPT=cars hberten/mydocker:latest env
```







