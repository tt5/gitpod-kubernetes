import * as k8s from "@pulumi/kubernetes";
import * as path from "path";

const tekton = new k8s.yaml.ConfigFile("tekton", {
  file: "https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml",
});

const manifests = new k8s.yaml.ConfigGroup("manifests", {
	files: [ path.join("manifests", "*.yml") ],
}, {dependsOn: [tekton]});

