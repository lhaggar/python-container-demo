# Python Container Demo
Super simple example of running python inside a docker container...

## Development
* `make up` to build and run development container, this will volume mount the _src_ directory into the container and leave the container detached and waiting.
* `make run` to run the code as it is currently on disk. You can edit the code, save, and then run as you develop.
* `make down` to stop and remove the development container.

## Building/Releasing
* Set the _VERSION_ var in the Makefile.
* `make all` to clean, build and export the docker image to file.
* The _export_ folder will contain a .tar file which can be loaded into docker by running `docker load < [the-filename].tar`
