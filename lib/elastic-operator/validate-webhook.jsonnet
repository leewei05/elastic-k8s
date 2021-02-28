{
  apiVersion: 'admissionregistration.k8s.io/v1beta1',
  kind: 'ValidatingWebhookConfiguration',
  metadata: {
    name: 'elastic-webhook.k8s.elastic.co',
    labels: {
      'control-plane': 'elastic-operator',
      'app.kubernetes.io/version': '1.4.0',
    },
  },
  webhooks: [
    {
      clientConfig: {
        caBundle: 'Cg==',
        service: {
          name: 'elastic-webhook-server',
          namespace: 'elastic-system',
          path: '/validate-agent-k8s-elastic-co-v1alpha1-agent',
        },
      },
      failurePolicy: 'Ignore',
      name: 'elastic-agent-validation-v1alpha1.k8s.elastic.co',
      rules: [
        {
          apiGroups: [
            'agent.k8s.elastic.co',
          ],
          apiVersions: [
            'v1alpha1',
          ],
          operations: [
            'CREATE',
            'UPDATE',
          ],
          resources: [
            'agents',
          ],
        },
      ],
    },
    {
      clientConfig: {
        caBundle: 'Cg==',
        service: {
          name: 'elastic-webhook-server',
          namespace: 'elastic-system',
          path: '/validate-apm-k8s-elastic-co-v1-apmserver',
        },
      },
      failurePolicy: 'Ignore',
      name: 'elastic-apm-validation-v1.k8s.elastic.co',
      rules: [
        {
          apiGroups: [
            'apm.k8s.elastic.co',
          ],
          apiVersions: [
            'v1',
          ],
          operations: [
            'CREATE',
            'UPDATE',
          ],
          resources: [
            'apmservers',
          ],
        },
      ],
    },
    {
      clientConfig: {
        caBundle: 'Cg==',
        service: {
          name: 'elastic-webhook-server',
          namespace: 'elastic-system',
          path: '/validate-apm-k8s-elastic-co-v1beta1-apmserver',
        },
      },
      failurePolicy: 'Ignore',
      name: 'elastic-apm-validation-v1beta1.k8s.elastic.co',
      rules: [
        {
          apiGroups: [
            'apm.k8s.elastic.co',
          ],
          apiVersions: [
            'v1beta1',
          ],
          operations: [
            'CREATE',
            'UPDATE',
          ],
          resources: [
            'apmservers',
          ],
        },
      ],
    },
    {
      clientConfig: {
        caBundle: 'Cg==',
        service: {
          name: 'elastic-webhook-server',
          namespace: 'elastic-system',
          path: '/validate-beat-k8s-elastic-co-v1beta1-beat',
        },
      },
      failurePolicy: 'Ignore',
      name: 'elastic-beat-validation-v1beta1.k8s.elastic.co',
      rules: [
        {
          apiGroups: [
            'beat.k8s.elastic.co',
          ],
          apiVersions: [
            'v1beta1',
          ],
          operations: [
            'CREATE',
            'UPDATE',
          ],
          resources: [
            'beats',
          ],
        },
      ],
    },
    {
      clientConfig: {
        caBundle: 'Cg==',
        service: {
          name: 'elastic-webhook-server',
          namespace: 'elastic-system',
          path: '/validate-enterprisesearch-k8s-elastic-co-v1beta1-enterprisesearch',
        },
      },
      failurePolicy: 'Ignore',
      name: 'elastic-ent-validation-v1beta1.k8s.elastic.co',
      rules: [
        {
          apiGroups: [
            'enterprisesearch.k8s.elastic.co',
          ],
          apiVersions: [
            'v1beta1',
          ],
          operations: [
            'CREATE',
            'UPDATE',
          ],
          resources: [
            'enterprisesearches',
          ],
        },
      ],
    },
    {
      clientConfig: {
        caBundle: 'Cg==',
        service: {
          name: 'elastic-webhook-server',
          namespace: 'elastic-system',
          path: '/validate-elasticsearch-k8s-elastic-co-v1-elasticsearch',
        },
      },
      failurePolicy: 'Ignore',
      name: 'elastic-es-validation-v1.k8s.elastic.co',
      rules: [
        {
          apiGroups: [
            'elasticsearch.k8s.elastic.co',
          ],
          apiVersions: [
            'v1',
          ],
          operations: [
            'CREATE',
            'UPDATE',
          ],
          resources: [
            'elasticsearches',
          ],
        },
      ],
    },
    {
      clientConfig: {
        caBundle: 'Cg==',
        service: {
          name: 'elastic-webhook-server',
          namespace: 'elastic-system',
          path: '/validate-elasticsearch-k8s-elastic-co-v1beta1-elasticsearch',
        },
      },
      failurePolicy: 'Ignore',
      name: 'elastic-es-validation-v1beta1.k8s.elastic.co',
      rules: [
        {
          apiGroups: [
            'elasticsearch.k8s.elastic.co',
          ],
          apiVersions: [
            'v1beta1',
          ],
          operations: [
            'CREATE',
            'UPDATE',
          ],
          resources: [
            'elasticsearches',
          ],
        },
      ],
    },
    {
      clientConfig: {
        caBundle: 'Cg==',
        service: {
          name: 'elastic-webhook-server',
          namespace: 'elastic-system',
          path: '/validate-kibana-k8s-elastic-co-v1-kibana',
        },
      },
      failurePolicy: 'Ignore',
      name: 'elastic-kb-validation-v1.k8s.elastic.co',
      rules: [
        {
          apiGroups: [
            'kibana.k8s.elastic.co',
          ],
          apiVersions: [
            'v1',
          ],
          operations: [
            'CREATE',
            'UPDATE',
          ],
          resources: [
            'kibanas',
          ],
        },
      ],
    },
    {
      clientConfig: {
        caBundle: 'Cg==',
        service: {
          name: 'elastic-webhook-server',
          namespace: 'elastic-system',
          path: '/validate-kibana-k8s-elastic-co-v1beta1-kibana',
        },
      },
      failurePolicy: 'Ignore',
      name: 'elastic-kb-validation-v1beta1.k8s.elastic.co',
      rules: [
        {
          apiGroups: [
            'kibana.k8s.elastic.co',
          ],
          apiVersions: [
            'v1beta1',
          ],
          operations: [
            'CREATE',
            'UPDATE',
          ],
          resources: [
            'kibanas',  //
          ],
        },
      ],
    },
  ],
}
