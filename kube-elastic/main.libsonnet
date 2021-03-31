local elasticsearch = import './components/elasticsearch.libsonnet';
local customMixin = import './components/mixin/custom.libsonnet';

{
  values:: {
    common: {
      namespace: 'default',
    },
    elasticsearch: {
      namespace: $.values.common.namespace,
      name: 'es',
    },
    kubeElastic: {
      namespace: $.values.common.namespace,
    },
  },

  elasticsearch: elasticsearch($.values.elasticsearch),
  kubeElastic: customMixin($.values.kubeElastic) + {
    namespace: {
      apiVersion: 'v1',
      kind: 'Namespace',
      metadata: {
        name: $.values.kubeElastic.namespace,
      },
    },
  },
}
