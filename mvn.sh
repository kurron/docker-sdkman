#!/bin/bash

CMD="docker run \
       --rm \
       --name maven \
       --net "host" \
       --user 1000:1000 \
       --volume $HOME:/home/developer \
       kurron/docker-maven:latest"

#echo $CMD
eval $CMD $*
