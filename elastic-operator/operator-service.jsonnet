{
  apiVersion: 'v1',
  kind: 'Service',
  metadata: {
    name: 'elastic-webhook-server',
    namespace: 'elastic-system',
    labels: {
      'control-plane': 'elastic-operator',
      'app.kubernetes.io/version': '1.4.0',
    },
  },
  spec: {
    ports: [
      {
        name: 'https',
        port: 443,
        targetPort: 9443,
      },
    ],
    selector: {
      'control-plane': 'elastic-operator',
    },
  },
}
