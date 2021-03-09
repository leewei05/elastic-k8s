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
          count: 1,
          podTemplate: {
            spec: {
              containers: [
                {
                  name: $._config.elasticsearch.name,
                  resources: {
                    requests: {
                      memory: '2Gi',
                      cpu: 1,
                    },
                    limits: {
                      memory: '2Gi',
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
          count: 5,
          config: {
            'node.roles': ['data', 'ingest', 'ml', 'transform'],
          },
          volumeClaimTemplates: [
            {
              metadata: {
                name: 'elasticsearch-data',
              },
              spec: {
                accessModes: [
                  'ReadWriteOnce',
                ],
                resources: {
                  requests: {
                    storage: '100Gi',
                  },
                },
                storageClassName: 'standard',
              },
            },
          ],
        },
      ],
    },
  },
}
