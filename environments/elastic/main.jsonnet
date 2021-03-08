(import 'elasticsearch.jsonnet') +

{
  my_namespace: {
    apiVersion: 'v1',
    kind: 'Namespace',
    metadata: {
      name: 'elastic',
    },
  },
}
