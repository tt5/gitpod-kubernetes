import * as k8s from "@pulumi/kubernetes";

const nginx = new k8s.yaml.ConfigFile("nginx", {
	file: "nginx.yml",
});
