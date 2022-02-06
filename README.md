**Website is now part of the [bullentwork constellation](https://github.com/doxa-tech/bullenetwork-constellation)**

http://eebulle.ch


### Using docker

Build with

```
docker-compose build
```

Run webserver with

```
docker-compose up
```

Create database with

```
docker-compose run web rake db:create
```

Shutdown webserver with

```
docker-compose down
```

Rebuild with

```
docker-compose up --build
```
