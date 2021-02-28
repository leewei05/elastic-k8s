{
  apiVersion: 'rbac.authorization.k8s.io/v1',
  kind: 'ClusterRole',
  metadata: {
    name: 'elastic-operator-view',
    labels: {
      'rbac.authorization.k8s.io/aggregate-to-view': 'true',
      'rbac.authorization.k8s.io/aggregate-to-edit': 'true',
      'rbac.authorization.k8s.io/aggregate-to-admin': 'true',
      'control-plane': 'elastic-operator',
      'app.kubernetes.io/version': '1.4.0',
    },
  },
  rules: [
    {
      apiGroups: [
        'elasticsearch.k8s.elastic.co',
      ],
      resources: [
        'elasticsearches',
      ],
      verbs: [
        'get',
        'list',
        'watch',
      ],
    },
    {
      apiGroups: [
        'apm.k8s.elastic.co',
      ],
      resources: [
        'apmservers',
      ],
      verbs: [
        'get',
        'list',
        'watch',
      ],
    },
    {
      apiGroups: [
        'kibana.k8s.elastic.co',
      ],
      resources: [
        'kibanas',
      ],
      verbs: [
        'get',
        'list',
        'watch',
      ],
    },
    {
      apiGroups: [
        'enterprisesearch.k8s.elastic.co',
      ],
      resources: [
        'enterprisesearches',
      ],
      verbs: [
        'get',
        'list',
        'watch',
      ],
    },
    {
      apiGroups: [
        'beat.k8s.elastic.co',
      ],
      resources: [
        'beats',
      ],
      verbs: [
        'get',
        'list',
        'watch',
      ],
    },
  ],
}
