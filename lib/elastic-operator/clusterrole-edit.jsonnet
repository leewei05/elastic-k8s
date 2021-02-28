{
  apiVersion: 'rbac.authorization.k8s.io/v1',
  kind: 'ClusterRole',
  metadata: {
    name: 'elastic-operator-edit',
    labels: {
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
        'create',
        'delete',
        'deletecollection',
        'patch',
        'update',
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
        'create',
        'delete',
        'deletecollection',
        'patch',
        'update',
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
        'create',
        'delete',
        'deletecollection',
        'patch',
        'update',
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
        'create',
        'delete',
        'deletecollection',
        'patch',
        'update',
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
        'create',
        'delete',
        'deletecollection',
        'patch',
        'update',
      ],
    },
  ],
}
