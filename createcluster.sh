#!/bin/sh
civo kubernetes create gitpod-test2 --size "g4s.kube.small" --nodes 3 --wait --save --merge --region FRA1 --remove-applications=Traefik
