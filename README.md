bash stuff

[![Build Status](https://travis-ci.org/ericminio/learning-bash.svg?branch=master)](https://travis-ci.org/ericminio/learning-bash)

```
docker built -t ubuntu:travis .
docker run -it --rm --name bash -v ${PWD}:/usr/local/src ubuntu:travis
```

```
cd /usr/local/src
./run.sh
```