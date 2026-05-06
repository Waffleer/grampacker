Dockerfile for Gram Packer, a gear tracking app website.


Gram Packer is a fork of LighterPack LighterPack seems dead. So, I (fsf) forked it and updated it as far as I was able. I am technically competent, but I don't much enjoy working with web development, although I have done so professionally. I am generally happy to run a modern and maintained fork, but do not plan to take an active role in feature development.

See https://github.com/ffleming/grampacker for more information on running the application.

#### Example Docker Compose

```
---
version: '3.9'
services:
  mongodb:
    image: mongo:5-focal
    container_name: mongodb_grampacker
    expose:
      - "27017"
    volumes:
      - ./docker/data:/data/mongodb
    logging:
      driver: "json-file"
      options:
          max-size: "5m"
          max-file: "10"
    restart: unless-stopped

  grampacker:
    image: grampacker:latest
    container_name: grampacker
    expose:
      - "8080"
      - "3000"
    ports:
      - 8080:8080
      - 3000:3000
    restart: unless-stopped
    volumes: 
      - local.json:/var/www/grampacker/config/local.json # maps local `local.json` to `config/local.json` in docker container
```

#### Example local.json
```
{
    "environment"   : "development",
    "deployUrl": "http://localhost:3000",
    "publicUrl": "http://localhost:3000",
    "port": 3000,
    "devServerPort" : 8080,
    "bindings"      : [""],
    "databaseUrl": "mongodb://mongodb_grampacker:27017/grampacker",
    "imgurClientID": "",
    "mail": {
      "host": "mailhost.com",
      "post": 25,
      "username": "user",
      "password": "password",
      "fromAddress": "Site admin <noreply@yourdomain.com>"
    },
    "moderators": []
}
```