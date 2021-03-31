local ke =
  (import 'kube-elastic/main.libsonnet') +
  {
    values+:: {
      common+: {
        namespace: 'elastic',
      },
    },
  };

{ 'setup/0namespace-namespace': ke.kubeElastic.namespace } +
{ ['elastic-' + name]: ke.elasticsearch[name] for name in std.objectFields(ke.elasticsearch) }
