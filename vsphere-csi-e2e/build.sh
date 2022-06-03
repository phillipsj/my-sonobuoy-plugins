#!/usr/bin/env bash

REGISTRY=rancher
IMG=sonobuoy-plugins
TAG=v0.1.0-vsphere-csi-e2e

docker build . -t $REGISTRY/$IMG:$TAG
docker push $REGISTRY/$IMG:$TAG