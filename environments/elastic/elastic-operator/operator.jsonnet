(import 'serviceaccount.jsonnet') +

{
  elastic_namespace: {
    apiVersion: 'v1',
    kind: 'Namespace',
    metadata: {
      name: 'elastic-system',
      labels: {
        name: 'elastic-system',
        'control-plane': 'elastic-operator',
        'app.kubernetes.io/version': '1.4.0',
      },
    },
  },
}
