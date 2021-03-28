# Elastic Cloud Kubernetes

## Prerequisite

Install the following tools:
- [kubectl](https://kubernetes.io/docs/tasks/tools/) for managin Kubernetes cluster
- [Jsonnet](https://github.com/google/jsonnet)
- [jsonnet-bundler](https://github.com/jsonnet-bundler/jsonnet-bundler) for package management

## Getting Started

Apply namespace and resources for Elastic operator on Kubernetes.

```
kubectl apply -f elastic-operator/elastic-operator.yaml
```

## TODOs

- [ ] Paramterize configuration
- [ ] Isolate elastic CRD resources into libsonnet
- [ ] Kibana instance
- [ ] APM server instance
- [ ] Elastic agent
- [ ] Enterprise search
- [ ] Beats
- [ ] README
- [x] Isolate elastic CRD resources into other directory
- [x] Generate manifests file with build.sh
