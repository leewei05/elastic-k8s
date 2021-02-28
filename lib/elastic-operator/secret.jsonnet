{
  apiVersion: 'v1',
  kind: 'Secret',
  metadata: {
    name: 'elastic-webhook-server-cert',
    namespace: 'elastic-system',
    labels: {
      'control-plane': 'elastic-operator',
      'app.kubernetes.io/version': '1.4.0',
    },
  },
}
