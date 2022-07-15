#!/bin/bash
civo kubernetes config $(pulumi stack output clusterName --stack dev) --save > ./kubeconfig.civo
export KUBECONFIG=$(pwd)/kubeconfig.civo
