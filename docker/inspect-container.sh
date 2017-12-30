#!/bin/bash

docker run -it --init --entrypoint "/bin/bash" --rm -v `pwd`/..:/docs:Z drse/bookflow