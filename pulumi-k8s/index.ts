import * as k8s from "@pulumi/kubernetes";
import * as path from "path";

const manifests = new k8s.yaml.ConfigGroup("manifests", {
	files: [ path.join("manifests", "*.yml") ],
});
