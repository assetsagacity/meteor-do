# meteor-do

Easy meteor development using docker.

`meteor-do` lets you setup a meteor project on your machine in one command,
without installing anything else (no node, no meteor).
Requires only `docker` and `docker-compose` on your machine.

## Usage

install and run a new self-contained instance of VulcanJS (for example)

- `mkdir myProject && cd myProject`
- `docker run --rm -v {$PWD}:/app assetsagacity/meteor-do init https://github.com/VulcanJS/Vulcan.git`
- `./meteor`

Or create a new empty meteor project: `docker run --rm -v $PWD:/app assetsagacity/meteor-do init`

And perform standard meteor operations using `./meteor`, for example:

- `./meteor` runs the project
- `./meteor npm install --save somePackage`
- `./meteor shell`

## Install

1. install [docker](https://docs.docker.com/engine/installation/)
and [docker-compose](https://docs.docker.com/compose/install/)
1. create a folder for your new project and go into it
1. init: `docker run --rm -v ${PWD}:/app assetsagacity/meteor-do init`
1. now run your server: `./meteor`
1. you can access it at http://localhost:3000/

## Why

Traditional install methods involve installing meteor, mongo (and node if needed) globally.
Some of the drawbacks are:

- different projects on the same machine may require different versions, but global install prevents it.
- or an update on one project causes another project to break.
- to prevent this, you have to use additional special solutions (like nvm).
- this also pollutes your global install folders, and when a project is done, its tooling remains.
- it also leads to development machines being unique snowflakes, with code working on one machine but crashing on another.
- setting up a new machine takes a significant amount of time
- and if you're in a team, inconsistency between developers creep up - as well as the distance between development and production.
- just trying a new open source project can be daunting or risky.

These are all solved by a dockerized development environment approach.

## A word on Mac and Windows

Docker is officially supported on Mac and Windows,
but in my experience mounting local files is unbearably slow.

Unfortunately, this docker mounts all source files from the local filesystem,
so performance on non-Linux systems is not guaranteed (meaning: it's probably awfully slow)

## Thanks

- [docker](https://www.docker.com/) really changed my developer life
- [golden-garage/meteor-dev](https://github.com/golden-garage/meteor-dev) was the basis for this setup
