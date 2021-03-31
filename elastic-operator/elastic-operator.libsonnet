local defaults = {
  local defaults = self,
  name: 'elastic-operator',
  namespace: error 'must provide namespace',
  version: error 'must provide version',
  image: error 'must provide image',
  resources: {
    limits: { cpu: '1', memory: '512Mi' },
    requests: { cpu: '100m', memory: '150Mi' },
  },
  commonLabels:: {
    'app.kubernetes.io/name': 'elastic-operator',
    'app.kubernetes.io/version': defaults.version,
    'app.kubernetes.io/component': 'controller',
  },
  selectorLabels:: {
    [labelName]: defaults.commonLabels[labelName]
    for labelName in std.objectFields(defaults.commonLabels)
    if !std.setMember(labelName, ['app.kubernetes.io/version'])
  },
};

function(params) {
  local eo = self,
  config:: defaults + params,

  '0agentCustomResourceDefinition': import 'agent-crd.libsonnet',
}
