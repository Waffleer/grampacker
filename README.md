# Gram Packer

Gram Packer helps you track the gear you bring on adventures.

Gram Packer is a fork of [LighterPack](https://github.com/galenmaly/lighterpack)
LighterPack seems dead. So, I (fsf) forked it and updated it as far as I was
able. I am technically competent, but I don't much enjoy working with web
development, although I have done so professionally. I am generally happy to run
a modern and maintained fork, but do not plan to take an active role in feature
development.

## Development

1. Install node.js, npm and mongo
2. ```$ git clone https://github.com/ffleming/grampacker.git```
3. Install dependancies ```$ npm install```
4. start mongo ```$ mongod```
5. Start app ```$ npm start```
6. go to http://localhost:8080

You probably want to configure git to ignore linting changes:

```
git config blame.ignoreRevsFile .git-blame-ignore-revs`
```

## Building Docker

- docker build -t grampacker:0.0.1 .
- docker-compose up -d

#### Docker Compose

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

## Priorities

1. Bugfixes
2. Maintainability and infrastructure improvements
3. Quality-of-life upgrades
4. Extra features

GramPacker is not intended to grow and develop continuously. Much of its utility
is due to how lightweight it is. I am not interested in adding on large-scale
features that significantly broaden the application's scope like social
networking, AI, etc.

## Pull requests

Pull requests are very welcome!

## Issues

Bug reports, feature requests, questions, and so on are very welcome! Please use
the [issues page](https://github.com/ffleming/grampacker/issues).

## AI policy

I don't care what tools authors use to generate text, code etc. Just as I
shouldn't be able to tell if an author is using Emacs or vim, I shouldn't be
able to tell if their code comes from their head, from a template, from shallow
autocomplete, or through probabilistic traversal of a multidimensional language
model.

This is to say - use whatever tools you want, but no slop, please. This goes for
all contributions: code, issues, assets, etc.
