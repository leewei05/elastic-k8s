{
  apiVersion: 'v1',
  kind: 'ServiceAccount',
  metadata: {
    name: 'elastic-operator',
    namespace: 'elastic-system',
    labels: {
      'control-plane': 'elastic-operator',
      'app.kubernetes.io/version': '1.4.0',
    },
  },
}
