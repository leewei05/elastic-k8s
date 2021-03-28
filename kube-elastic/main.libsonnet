local es = import './components/elasticsearch.libsonnet';

{
  values:: {
    common: {
      namespace: 'default',
    },
    es: {
      namespace: $.values.common.namespace,
      name: 'es',
    },
  },

  es: es($.values.es),
}
