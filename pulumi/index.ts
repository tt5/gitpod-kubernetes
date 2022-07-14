import * as civo from "@pulumi/civo"

const fw = new civo.Firewall("k8s-sample-fw", {
    region: "fra1"
})

const cluster = new civo.KubernetesCluster("acc-test",
{
    tags: "demo-kubernetes-typescript",
    region: "fra1",
    firewallId: fw.id,
    pools: {
        nodeCount: 1,
        size: "g4s.kube.xsmall",
    }
}, {
    ignoreChanges: ["tags"]
})

export const clusterName = cluster.name;