# Dockerized Gitbook Workflow

## Getting started

The utility scripts in the folder all run the workflow through docker.

First, you need to build the docker image via `docker\build.sh`, then, use any of the scripts in the root dir.

`./gitbook` is the entry into the dockerized gitbook and you'll first want to `./gitbook install` to install the plugins.

`./all` generates all the outputs into the local `build` directory.

## Helper Scripts

`./update` will add the whole src folder and push it to git, helpful for one-shot content updates.

## Resources

- Docker scripts originally from: https://github.com/humangeo/gitbook-docker