(import '../lib/k.libsonnet') +
(import 'elasticsearch.jsonnet') +

{
  my_namespace: {
    apiVersion: 'v1',
    kind: 'Namespace',
    metadata: {
      name: 'elastic',
    },
  },

  _config:: {
    elasticsearch: {
      name: 'elasticsearch',
      requestMEM: '2Gi',
      requestCPU: 1,
      limitMEM: '2Gi',
    },
  },
}
