{
  elasticsearch: {
    apiVersion: 'elasticsearch.k8s.elastic.co/v1',
    kind: 'Elasticsearch',
    metadata: {
      name: 'elasticseach',
      namespace: 'elastic',
    },
    spec: {
      version: '7.11.1',
      nodeSets: [
        {
          name: 'masters',
          count: 3,
          config: {
            'node.store.allow_mmap': false,
            'node.roles': ['master'],
            // enable ml api on master nodes
            'xpack.ml.enabled': true,
            // remote_cluster_client: local es cluster can connect to this cluster
            'node.remote_cluster_client': false,
          },
        },
        {
          name: 'data',
          count: 10,
          config: {
            'node.roles': ['data', 'ingest', 'ml', 'transform'],
            'node.remote_cluster_client': false,
          },
        },
      ],
    },
  },
}
