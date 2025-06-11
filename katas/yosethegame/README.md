[![yosethegame](https://img.shields.io/badge/yosethegame-20-00A000?style=flat)](https://yosethegame.com)

```
docker compose -f support/ci/docker-compose.yml run --rm -it --name bash -p 8333:8333 bash
cd katas/yosethegame/
./server.sh
```

`npm run play http://127.0.0.1:8333`