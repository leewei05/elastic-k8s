{
  apiVersion: 'v1',
  kind: 'ConfigMap',
  metadata: {
    name: 'elastic-operator',
    namespace: 'elastic-system',
    labels: {
      'control-plane': 'elastic-operator',
      'app.kubernetes.io/version': '1.4.0',
    },
  },
  data: {
    'eck.yaml': |||
      log-verbosity: 0
      metrics-port: 0
      container-registry: docker.elastic.co
      max-concurrent-reconciles: 3
      ca-cert-validity: 8760h
      ca-cert-rotate-before: 24h
      cert-validity: 8760h
      cert-rotate-before: 24h
      set-default-security-context: true
      kube-client-timeout: 60s
      elasticsearch-client-timeout: 180s
      disable-telemetry: false
      validate-storage-class: true
      enable-webhook: true
      webhook-name: elastic-webhook.k8s.elastic.co
    |||,
  },
}
