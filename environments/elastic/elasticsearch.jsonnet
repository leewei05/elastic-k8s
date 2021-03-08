{
  elasticsearch: {
    apiVersion: 'elasticsearch.k8s.elastic.co/v1',
    kind: 'Elasticsearch',
    metadata: {
      name: 'elasticsearch',
      namespace: 'elastic',
    },
    spec: {
      version: '7.11.1',
      nodeSets: [
        {
          name: 'masters',
          count: 3,
          podTemplate: {
            spec: {
              containers: [
                {
                  name: 'elasticsearch',
                  env: [
                    {
                      name: 'ES_JAVA_OPTS',
                      value: '-Xms2g -Xmx2g',
                    },
                  ],
                  resources: {
                    requests: {
                      memory: '4Gi',
                      cpu: 8,
                    },
                    limits: {
                      memory: '4Gi',
                    },
                  },
                },
              ],
            },
          },
          config: {
            'node.store.allow_mmap': false,
            'node.roles': ['master'],
            // enable ml api on master nodes
            'xpack.ml.enabled': true,
          },
        },
        {
          name: 'data',
          count: 10,
          config: {
            'node.roles': ['data', 'ingest', 'ml', 'transform'],
          },
        },
      ],
    },
  },
}
