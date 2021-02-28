{
  apiVersion: 'rbac.authorization.k8s.io/v1',
  kind: 'ClusterRole',
  metadata: {
    name: 'elastic-operator',
    labels: {
      'control-plane': 'elastic-operator',
      'app.kubernetes.io/version': '1.4.0',
    },
  },
  rules: [
    {
      apiGroups: [
        'authorization.k8s.io',
      ],
      resources: [
        'subjectaccessreviews',
      ],
      verbs: [
        'create',
      ],
    },
    {
      apiGroups: [
        '',
      ],
      resources: [
        'pods',
        'endpoints',
        'events',
        'persistentvolumeclaims',
        'secrets',
        'services',
        'configmaps',
        'serviceaccounts',
      ],
      verbs: [
        'get',
        'list',
        'watch',
        'create',
        'update',
        'patch',
        'delete',
      ],
    },
    {
      apiGroups: [
        'apps',
      ],
      resources: [
        'deployments',
        'statefulsets',
        'daemonsets',
      ],
      verbs: [
        'get',
        'list',
        'watch',
        'create',
        'update',
        'patch',
        'delete',
      ],
    },
    {
      apiGroups: [
        'policy',
      ],
      resources: [
        'poddisruptionbudgets',
      ],
      verbs: [
        'get',
        'list',
        'watch',
        'create',
        'update',
        'patch',
        'delete',
      ],
    },
    {
      apiGroups: [
        'elasticsearch.k8s.elastic.co',
      ],
      resources: [
        'elasticsearches',
        'elasticsearches/status',
        'elasticsearches/finalizers',  // needed for ownerReferences with blockOwnerDeletion on OCP
        'enterpriselicenses',
        'enterpriselicenses/status',
      ],
      verbs: [
        'get',
        'list',
        'watch',
        'create',
        'update',
        'patch',
        'delete',
      ],
    },
    {
      apiGroups: [
        'kibana.k8s.elastic.co',
      ],
      resources: [
        'kibanas',
        'kibanas/status',
        'kibanas/finalizers',  // needed for ownerReferences with blockOwnerDeletion on OCP
      ],
      verbs: [
        'get',
        'list',
        'watch',
        'create',
        'update',
        'patch',
        'delete',
      ],
    },
    {
      apiGroups: [
        'apm.k8s.elastic.co',
      ],
      resources: [
        'apmservers',
        'apmservers/status',
        'apmservers/finalizers',  // needed for ownerReferences with blockOwnerDeletion on OCP
      ],
      verbs: [
        'get',
        'list',
        'watch',
        'create',
        'update',
        'patch',
        'delete',
      ],
    },
    {
      apiGroups: [
        'enterprisesearch.k8s.elastic.co',
      ],
      resources: [
        'enterprisesearches',
        'enterprisesearches/status',
        'enterprisesearches/finalizers',  // needed for ownerReferences with blockOwnerDeletion on OCP
      ],
      verbs: [
        'get',
        'list',
        'watch',
        'create',
        'update',
        'patch',
        'delete',
      ],
    },
    {
      apiGroups: [
        'beat.k8s.elastic.co',
      ],
      resources: [
        'beats',
        'beats/status',
        'beats/finalizers',  // needed for ownerReferences with blockOwnerDeletion on OCP
      ],
      verbs: [
        'get',
        'list',
        'watch',
        'create',
        'update',
        'patch',
        'delete',
      ],
    },
    {
      apiGroups: [
        'agent.k8s.elastic.co',
      ],
      resources: [
        'agents',
        'agents/status',
        'agents/finalizers',  // needed for ownerReferences with blockOwnerDeletion on OCP
      ],
      verbs: [
        'get',
        'list',
        'watch',
        'create',
        'update',
        'patch',
        'delete',
      ],
    },
    {
      apiGroups: [
        'storage.k8s.io',
      ],
      resources: [
        'storageclasses',
      ],
      verbs: [
        'get',
        'list',
        'watch',
      ],
    },
    {
      apiGroups: [
        'admissionregistration.k8s.io',
      ],
      resources: [
        'mutatingwebhookconfigurations',
        'validatingwebhookconfigurations',
      ],
      verbs: [
        'get',
        'list',
        'watch',
        'create',
        'update',
        'patch',
        'delete',
      ],
    },
  ],
}
