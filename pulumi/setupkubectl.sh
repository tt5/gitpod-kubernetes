#!/bin/bash
civo kubernetes config $(pulumi stack output clusterName --stack cluster) --save > ./kubeconfig.civo
export KUBECONFIG=$(pwd)/kubeconfig.civo
