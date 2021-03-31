local defaults = {
  name: 'kube-elastic',
  namespace: error 'must provide namespace',
  commonLabels:: {
    'app.kubernetes.io/name': 'kube-elastic',
  },
};

function(params) {
  local m = self,
  config:: defaults + params,
}
