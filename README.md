bash stuff

[![Build Status](https://travis-ci.org/ericminio/learning-bash.svg?branch=master)](https://travis-ci.org/ericminio/learning-bash)

```
docker build -t bash:alpine .
docker run -it --rm --name bash -v ${PWD}:/usr/local/src bash:alpine ./run.sh
```