{
  apiVersion: 'apps/v1',
  kind: 'StatefulSet',
  metadata: {
    name: 'elastic-operator',
    namespace: 'elastic-system',
    labels: {
      'control-plane': 'elastic-operator',
      'app.kubernetes.io/version': '1.4.0',
    },
  },
  spec: {
    selector: {
      matchLabels: {
        'control-plane': 'elastic-operator',
      },
    },
    serviceName: 'elastic-operator',
    replicas: 1,
    template: {
      metadata: {
        annotations: {
          // Rename the fields "error" to "error.message" and "source" to "event.source"
          // This is to avoid a conflict with the ECS "error" and "source" documents.
          'co.elastic.logs/raw': '[{"type":"container","json.keys_under_root":true,"paths":["/var/log/containers/*${data.kubernetes.container.id}.log"],"processors":[{"convert":{"mode":"rename","ignore_missing":true,"fields":[{"from":"error","to":"_error"}]}},{"convert":{"mode":"rename","ignore_missing":true,"fields":[{"from":"_error","to":"error.message"}]}},{"convert":{"mode":"rename","ignore_missing":true,"fields":[{"from":"source","to":"_source"}]}},{"convert":{"mode":"rename","ignore_missing":true,"fields":[{"from":"_source","to":"event.source"}]}}]}]',
          'checksum/config': '0d548bc052adb33254689ac24a212460301624526d6dc5336fb42d10c9775770',
        },
        labels: {
          'control-plane': 'elastic-operator',
        },
      },
      spec: {
        terminationGracePeriodSeconds: 10,
        serviceAccountName: 'elastic-operator',
        securityContext: {
          runAsNonRoot: true,
        },
        containers: [
          {
            image: 'docker.elastic.co/eck/eck-operator:1.4.0',
            imagePullPolicy: 'IfNotPresent',
            name: 'manager',
            args: [
              'manager',
              '--config=/conf/eck.yaml',
              '--distribution-channel=all-in-one',
            ],
            env: [
              {
                name: 'OPERATOR_NAMESPACE',
                valueFrom: {
                  fieldRef: {
                    fieldPath: 'metadata.namespace',
                  },
                },
              },
              {
                name: 'POD_IP',
                valueFrom: {
                  fieldRef: {
                    fieldPath: 'status.podIP',
                  },
                },
              },
              {
                name: 'WEBHOOK_SECRET',
                value: 'elastic-webhook-server-cert',
              },
            ],
            resources: {
              limits: {
                cpu: 1,
                memory: '512Mi',
              },
              requests: {
                cpu: '100m',
                memory: '150Mi',
              },
            },
            ports: [
              {
                containerPort: 9443,
                name: 'https-webhook',
                protocol: 'TCP',
              },
            ],
            volumeMounts: [
              {
                mountPath: '/conf',
                name: 'conf',
                readOnly: true,
              },
              {
                mountPath: '/tmp/k8s-webhook-server/serving-certs',
                name: 'cert',
                readOnly: true,
              },
            ],
          },
        ],
        volumes: [
          {
            name: 'conf',
            configMap: {
              name: 'elastic-operator',
            },
          },
          {
            name: 'cert',
            secret: {
              defaultMode: 420,
              secretName: 'elastic-webhook-server-cert',
            },
          },
        ],
      },
    },
  },
}
