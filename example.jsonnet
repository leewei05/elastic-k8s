local ke =
  (import 'kube-elastic/main.libsonnet') +
  {
    values+:: {
      common+: {
        namespace: 'elastic',
      },
    },
  };

{ ['elastic-' + name]: ke.es[name] for name in std.objectFields(ke.es) }
