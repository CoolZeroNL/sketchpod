#!/bin/bash

sudo docker build -t sketchpod .
sudo docker tag sketchpod harwig/sketchpod
docker push harwig/sketchpod