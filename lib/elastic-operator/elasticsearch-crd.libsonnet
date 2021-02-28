{
  // Source: eck-operator/charts/eck-operator-crds/templates/all-crds.yaml
  apiVersion: 'apiextensions.k8s.io/v1beta1',
  kind: 'CustomResourceDefinition',
  metadata: {
    annotations: {
      'controller-gen.kubebuilder.io/version': 'v0.4.0',
    },
    creationTimestamp: null,
    labels: {
      'app.kubernetes.io/instance': 'elastic-operator',
      'app.kubernetes.io/name': 'eck-operator-crds',
      'app.kubernetes.io/version': '1.4.0',
    },
    name: 'elasticsearches.elasticsearch.k8s.elastic.co',
  },
  spec: {
    additionalPrinterColumns: [
      {
        JSONPath: '.status.health',
        name: 'health',
        type: 'string',
      },
      {
        JSONPath: '.status.availableNodes',
        description: 'Available nodes',
        name: 'nodes',
        type: 'integer',
      },
      {
        JSONPath: '.status.version',
        description: 'Elasticsearch version',
        name: 'version',
        type: 'string',
      },
      {
        JSONPath: '.status.phase',
        name: 'phase',
        type: 'string',
      },
      {
        JSONPath: '.metadata.creationTimestamp',
        name: 'age',
        type: 'date',
      },
    ],
    group: 'elasticsearch.k8s.elastic.co',
    names: {
      categories: [
        'elastic',
      ],
      kind: 'Elasticsearch',
      listKind: 'ElasticsearchList',
      plural: 'elasticsearches',
      shortNames: [
        'es',
      ],
      singular: 'elasticsearch',
    },
    scope: 'Namespaced',
    subresources: {
      status: {
      },
    },
    validation: {
      openAPIV3Schema: {
        description: 'Elasticsearch represents an Elasticsearch resource in a Kubernetes cluster.',
        properties: {
          apiVersion: {
            description: 'APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources',
            type: 'string',
          },
          kind: {
            description: 'Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds',
            type: 'string',
          },
          metadata: {
            type: 'object',
          },
          spec: {
            description: 'ElasticsearchSpec holds the specification of an Elasticsearch cluster.',
            properties: {
              auth: {
                description: 'Auth contains user authentication and authorization security settings for Elasticsearch.',
                properties: {
                  fileRealm: {
                    description: 'FileRealm to propagate to the Elasticsearch cluster.',
                    items: {
                      description: 'FileRealmSource references users to create in the Elasticsearch cluster.',
                      properties: {
                        secretName: {
                          description: 'SecretName is the name of the secret.',
                          type: 'string',
                        },
                      },
                      type: 'object',
                    },
                    type: 'array',
                  },
                  roles: {
                    description: 'Roles to propagate to the Elasticsearch cluster.',
                    items: {
                      description: 'RoleSource references roles to create in the Elasticsearch cluster.',
                      properties: {
                        secretName: {
                          description: 'SecretName is the name of the secret.',
                          type: 'string',
                        },
                      },
                      type: 'object',
                    },
                    type: 'array',
                  },
                },
                type: 'object',
              },
              http: {
                description: 'HTTP holds HTTP layer settings for Elasticsearch.',
                properties: {
                  service: {
                    description: 'Service defines the template for the associated Kubernetes Service object.',
                    properties: {
                      metadata: {
                        description: 'ObjectMeta is the metadata of the service. The name and namespace provided here are managed by ECK and will be ignored.',
                        type: 'object',
                      },
                      spec: {
                        description: 'Spec is the specification of the service.',
                        properties: {
                          clusterIP: {
                            description: 'clusterIP is the IP address of the service and is usually assigned randomly by the master. If an address is specified manually and is not in use by others, it will be allocated to the service; otherwise, creation of the service will fail. This field can not be changed through updates. Valid values are "None", empty string (""), or a valid IP address. "None" can be specified for headless services when proxying is not required. Only applies to types ClusterIP, NodePort, and LoadBalancer. Ignored if type is ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                            type: 'string',
                          },
                          externalIPs: {
                            description: 'externalIPs is a list of IP addresses for which nodes in the cluster will also accept traffic for this service.  These IPs are not managed by Kubernetes.  The user is responsible for ensuring that traffic arrives at a node with this IP.  A common example is external load-balancers that are not part of the Kubernetes system.',
                            items: {
                              type: 'string',
                            },
                            type: 'array',
                          },
                          externalName: {
                            description: 'externalName is the external reference that kubedns or equivalent will return as a CNAME record for this service. No proxying will be involved. Must be a valid RFC-1123 hostname (https://tools.ietf.org/html/rfc1123) and requires Type to be ExternalName.',
                            type: 'string',
                          },
                          externalTrafficPolicy: {
                            description: 'externalTrafficPolicy denotes if this Service desires to route external traffic to node-local or cluster-wide endpoints. "Local" preserves the client source IP and avoids a second hop for LoadBalancer and Nodeport type services, but risks potentially imbalanced traffic spreading. "Cluster" obscures the client source IP and may cause a second hop to another node, but should have good overall load-spreading.',
                            type: 'string',
                          },
                          healthCheckNodePort: {
                            description: 'healthCheckNodePort specifies the healthcheck nodePort for the service. If not specified, HealthCheckNodePort is created by the service api backend with the allocated nodePort. Will use user-specified nodePort value if specified by the client. Only effects when Type is set to LoadBalancer and ExternalTrafficPolicy is set to Local.',
                            format: 'int32',
                            type: 'integer',
                          },
                          ipFamily: {
                            description: "ipFamily specifies whether this Service has a preference for a particular IP family (e.g. IPv4 vs. IPv6).  If a specific IP family is requested, the clusterIP field will be allocated from that family, if it is available in the cluster.  If no IP family is requested, the cluster's primary IP family will be used. Other IP fields (loadBalancerIP, loadBalancerSourceRanges, externalIPs) and controllers which allocate external load-balancers should use the same IP family.  Endpoints for this Service will be of this family.  This field is immutable after creation. Assigning a ServiceIPFamily not available in the cluster (e.g. IPv6 in IPv4 only cluster) is an error condition and will fail during clusterIP assignment.",
                            type: 'string',
                          },
                          loadBalancerIP: {
                            description: 'Only applies to Service Type: LoadBalancer LoadBalancer will get created with the IP specified in this field. This feature depends on whether the underlying cloud-provider supports specifying the loadBalancerIP when a load balancer is created. This field will be ignored if the cloud-provider does not support the feature.',
                            type: 'string',
                          },
                          loadBalancerSourceRanges: {
                            description: 'If specified and supported by the platform, this will restrict traffic through the cloud-provider load-balancer will be restricted to the specified client IPs. This field will be ignored if the cloud-provider does not support the feature." More info: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/',
                            items: {
                              type: 'string',
                            },
                            type: 'array',
                          },
                          ports: {
                            description: 'The list of ports that are exposed by this service. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                            items: {
                              description: "ServicePort contains information on service's port.",
                              properties: {
                                appProtocol: {
                                  description: 'The application protocol for this port. This field follows standard Kubernetes label syntax. Un-prefixed names are reserved for IANA standard service names (as per RFC-6335 and http://www.iana.org/assignments/service-names). Non-standard protocols should use prefixed names such as mycompany.com/my-custom-protocol. Field can be enabled with ServiceAppProtocol feature gate.',
                                  type: 'string',
                                },
                                name: {
                                  description: "The name of this port within the service. This must be a DNS_LABEL. All ports within a ServiceSpec must have unique names. When considering the endpoints for a Service, this must match the 'name' field in the EndpointPort. Optional if only one ServicePort is defined on this service.",
                                  type: 'string',
                                },
                                nodePort: {
                                  description: 'The port on each node on which this service is exposed when type=NodePort or LoadBalancer. Usually assigned by the system. If specified, it will be allocated to the service if unused or else creation of the service will fail. Default is to auto-allocate a port if the ServiceType of this Service requires one. More info: https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport',
                                  format: 'int32',
                                  type: 'integer',
                                },
                                port: {
                                  description: 'The port that will be exposed by this service.',
                                  format: 'int32',
                                  type: 'integer',
                                },
                                protocol: {
                                  description: 'The IP protocol for this port. Supports "TCP", "UDP", and "SCTP". Default is TCP.',
                                  type: 'string',
                                },
                                targetPort: {
                                  anyOf: [
                                    {
                                      type: 'integer',
                                    },
                                    {
                                      type: 'string',
                                    },
                                  ],
                                  description: "Number or name of the port to access on the pods targeted by the service. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME. If this is a string, it will be looked up as a named port in the target Pod's container ports. If this is not specified, the value of the 'port' field is used (an identity map). This field is ignored for services with clusterIP=None, and should be omitted or set equal to the 'port' field. More info: https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service",
                                },
                              },
                              required: [
                                'port',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          publishNotReadyAddresses: {
                            description: "publishNotReadyAddresses, when set to true, indicates that DNS implementations must publish the notReadyAddresses of subsets for the Endpoints associated with the Service. The default value is false. The primary use case for setting this field is to use a StatefulSet's Headless Service to propagate SRV records for its Pods without respect to their readiness for purpose of peer discovery.",
                            type: 'boolean',
                          },
                          selector: {
                            additionalProperties: {
                              type: 'string',
                            },
                            description: 'Route service traffic to pods with label keys and values matching this selector. If empty or not present, the service is assumed to have an external process managing its endpoints, which Kubernetes will not modify. Only applies to types ClusterIP, NodePort, and LoadBalancer. Ignored if type is ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/',
                            type: 'object',
                          },
                          sessionAffinity: {
                            description: 'Supports "ClientIP" and "None". Used to maintain session affinity. Enable client IP based session affinity. Must be ClientIP or None. Defaults to None. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                            type: 'string',
                          },
                          sessionAffinityConfig: {
                            description: 'sessionAffinityConfig contains the configurations of session affinity.',
                            properties: {
                              clientIP: {
                                description: 'clientIP contains the configurations of Client IP based session affinity.',
                                properties: {
                                  timeoutSeconds: {
                                    description: 'timeoutSeconds specifies the seconds of ClientIP type session sticky time. The value must be >0 && <=86400(for 1 day) if ServiceAffinity == "ClientIP". Default value is 10800(for 3 hours).',
                                    format: 'int32',
                                    type: 'integer',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          topologyKeys: {
                            description: 'topologyKeys is a preference-order list of topology keys which implementations of services should use to preferentially sort endpoints when accessing this Service, it can not be used at the same time as externalTrafficPolicy=Local. Topology keys must be valid label keys and at most 16 keys may be specified. Endpoints are chosen based on the first topology key with available backends. If this field is specified and all entries have no backends that match the topology of the client, the service has no backends for that client and connections should fail. The special value "*" may be used to mean "any topology". This catch-all value, if used, only makes sense as the last value in the list. If this is not specified or empty, no topology constraints will be applied.',
                            items: {
                              type: 'string',
                            },
                            type: 'array',
                          },
                          type: {
                            description: 'type determines how the Service is exposed. Defaults to ClusterIP. Valid options are ExternalName, ClusterIP, NodePort, and LoadBalancer. "ExternalName" maps to the specified externalName. "ClusterIP" allocates a cluster-internal IP address for load-balancing to endpoints. Endpoints are determined by the selector or if that is not specified, by manual construction of an Endpoints object. If clusterIP is "None", no virtual IP is allocated and the endpoints are published as a set of endpoints rather than a stable IP. "NodePort" builds on ClusterIP and allocates a port on every node which routes to the clusterIP. "LoadBalancer" builds on NodePort and creates an external load-balancer (if supported in the current cloud) which routes to the clusterIP. More info: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types',
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                    },
                    type: 'object',
                  },
                  tls: {
                    description: 'TLS defines options for configuring TLS for HTTP.',
                    properties: {
                      certificate: {
                        description: |||
                          Certificate is a reference to a Kubernetes secret that contains the certificate and private key for enabling TLS. The referenced secret should contain the following: 
                           - `ca.crt`: The certificate authority (optional). - `tls.crt`: The certificate (or a chain). - `tls.key`: The private key to the first certificate in the certificate chain.
                        |||,
                        properties: {
                          secretName: {
                            description: 'SecretName is the name of the secret.',
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                      selfSignedCertificate: {
                        description: 'SelfSignedCertificate allows configuring the self-signed certificate generated by the operator.',
                        properties: {
                          disabled: {
                            description: 'Disabled indicates that the provisioning of the self-signed certifcate should be disabled.',
                            type: 'boolean',
                          },
                          subjectAltNames: {
                            description: 'SubjectAlternativeNames is a list of SANs to include in the generated HTTP TLS certificate.',
                            items: {
                              description: 'SubjectAlternativeName represents a SAN entry in a x509 certificate.',
                              properties: {
                                dns: {
                                  description: 'DNS is the DNS name of the subject.',
                                  type: 'string',
                                },
                                ip: {
                                  description: 'IP is the IP address of the subject.',
                                  type: 'string',
                                },
                              },
                              type: 'object',
                            },
                            type: 'array',
                          },
                        },
                        type: 'object',
                      },
                    },
                    type: 'object',
                  },
                },
                type: 'object',
              },
              image: {
                description: 'Image is the Elasticsearch Docker image to deploy.',
                type: 'string',
              },
              nodeSets: {
                description: 'NodeSets allow specifying groups of Elasticsearch nodes sharing the same configuration and Pod templates.',
                items: {
                  description: 'NodeSet is the specification for a group of Elasticsearch nodes sharing the same configuration and a Pod template.',
                  properties: {
                    config: {
                      description: 'Config holds the Elasticsearch configuration.',
                      type: 'object',
                    },
                    count: {
                      description: 'Count of Elasticsearch nodes to deploy.',
                      format: 'int32',
                      minimum: 1,
                      type: 'integer',
                    },
                    name: {
                      description: 'Name of this set of nodes. Becomes a part of the Elasticsearch node.name setting.',
                      maxLength: 23,
                      pattern: '[a-zA-Z0-9-]+',
                      type: 'string',
                    },
                    podTemplate: {
                      description: 'PodTemplate provides customisation options (labels, annotations, affinity rules, resource requests, and so on) for the Pods belonging to this NodeSet.',
                      type: 'object',
                    },
                    volumeClaimTemplates: {
                      description: 'VolumeClaimTemplates is a list of persistent volume claims to be used by each Pod in this NodeSet. Every claim in this list must have a matching volumeMount in one of the containers defined in the PodTemplate. Items defined here take precedence over any default claims added by the operator with the same name.',
                      items: {
                        description: "PersistentVolumeClaim is a user's request for and claim to a persistent volume",
                        properties: {
                          apiVersion: {
                            description: 'APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources',
                            type: 'string',
                          },
                          kind: {
                            description: 'Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds',
                            type: 'string',
                          },
                          metadata: {
                            description: "Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata",
                            type: 'object',
                          },
                          spec: {
                            description: 'Spec defines the desired characteristics of a volume requested by a pod author. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims',
                            properties: {
                              accessModes: {
                                description: 'AccessModes contains the desired access modes the volume should have. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1',
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                              },
                              dataSource: {
                                description: 'This field can be used to specify either: * An existing VolumeSnapshot object (snapshot.storage.k8s.io/VolumeSnapshot - Beta) * An existing PVC (PersistentVolumeClaim) * An existing custom resource/object that implements data population (Alpha) In order to use VolumeSnapshot object types, the appropriate feature gate must be enabled (VolumeSnapshotDataSource or AnyVolumeDataSource) If the provisioner or an external controller can support the specified data source, it will create a new volume based on the contents of the specified data source. If the specified data source is not supported, the volume will not be created and the failure will be reported as an event. In the future, we plan to support more data source types and the behavior of the provisioner may change.',
                                properties: {
                                  apiGroup: {
                                    description: 'APIGroup is the group for the resource being referenced. If APIGroup is not specified, the specified Kind must be in the core API group. For any other third-party types, APIGroup is required.',
                                    type: 'string',
                                  },
                                  kind: {
                                    description: 'Kind is the type of resource being referenced',
                                    type: 'string',
                                  },
                                  name: {
                                    description: 'Name is the name of resource being referenced',
                                    type: 'string',
                                  },
                                },
                                required: [
                                  'kind',
                                  'name',
                                ],
                                type: 'object',
                              },
                              resources: {
                                description: 'Resources represents the minimum resources the volume should have. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources',
                                properties: {
                                  limits: {
                                    additionalProperties: {
                                      anyOf: [
                                        {
                                          type: 'integer',
                                        },
                                        {
                                          type: 'string',
                                        },
                                      ],
                                      pattern: '^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$',
                                    },
                                    description: 'Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/',
                                    type: 'object',
                                  },
                                  requests: {
                                    additionalProperties: {
                                      anyOf: [
                                        {
                                          type: 'integer',
                                        },
                                        {
                                          type: 'string',
                                        },
                                      ],
                                      pattern: '^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$',
                                    },
                                    description: 'Requests describes the minimum amount of compute resources required. If Requests is omitted for a container, it defaults to Limits if that is explicitly specified, otherwise to an implementation-defined value. More info: https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/',
                                    type: 'object',
                                  },
                                },
                                type: 'object',
                              },
                              selector: {
                                description: 'A label query over volumes to consider for binding.',
                                properties: {
                                  matchExpressions: {
                                    description: 'matchExpressions is a list of label selector requirements. The requirements are ANDed.',
                                    items: {
                                      description: 'A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values.',
                                      properties: {
                                        key: {
                                          description: 'key is the label key that the selector applies to.',
                                          type: 'string',
                                        },
                                        operator: {
                                          description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist.",
                                          type: 'string',
                                        },
                                        values: {
                                          description: 'values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch.',
                                          items: {
                                            type: 'string',
                                          },
                                          type: 'array',
                                        },
                                      },
                                      required: [
                                        'key',
                                        'operator',
                                      ],
                                      type: 'object',
                                    },
                                    type: 'array',
                                  },
                                  matchLabels: {
                                    additionalProperties: {
                                      type: 'string',
                                    },
                                    description: 'matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.',
                                    type: 'object',
                                  },
                                },
                                type: 'object',
                              },
                              storageClassName: {
                                description: 'Name of the StorageClass required by the claim. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#class-1',
                                type: 'string',
                              },
                              volumeMode: {
                                description: 'volumeMode defines what type of volume is required by the claim. Value of Filesystem is implied when not included in claim spec.',
                                type: 'string',
                              },
                              volumeName: {
                                description: 'VolumeName is the binding reference to the PersistentVolume backing this claim.',
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                          status: {
                            description: 'Status represents the current information/status of a persistent volume claim. Read-only. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims',
                            properties: {
                              accessModes: {
                                description: 'AccessModes contains the actual access modes the volume backing the PVC has. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1',
                                items: {
                                  type: 'string',
                                },
                                type: 'array',
                              },
                              capacity: {
                                additionalProperties: {
                                  anyOf: [
                                    {
                                      type: 'integer',
                                    },
                                    {
                                      type: 'string',
                                    },
                                  ],
                                  pattern: '^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$',
                                },
                                description: 'Represents the actual resources of the underlying volume.',
                                type: 'object',
                              },
                              conditions: {
                                description: "Current Condition of persistent volume claim. If underlying persistent volume is being resized then the Condition will be set to 'ResizeStarted'.",
                                items: {
                                  description: 'PersistentVolumeClaimCondition contails details about state of pvc',
                                  properties: {
                                    lastProbeTime: {
                                      description: 'Last time we probed the condition.',
                                      format: 'date-time',
                                      type: 'string',
                                    },
                                    lastTransitionTime: {
                                      description: 'Last time the condition transitioned from one status to another.',
                                      format: 'date-time',
                                      type: 'string',
                                    },
                                    message: {
                                      description: 'Human-readable message indicating details about last transition.',
                                      type: 'string',
                                    },
                                    reason: {
                                      description: 'Unique, this should be a short, machine understandable string that gives the reason for condition\'s last transition. If it reports "ResizeStarted" that means the underlying persistent volume is being resized.',
                                      type: 'string',
                                    },
                                    status: {
                                      type: 'string',
                                    },
                                    type: {
                                      description: 'PersistentVolumeClaimConditionType is a valid value of PersistentVolumeClaimCondition.Type',
                                      type: 'string',
                                    },
                                  },
                                  required: [
                                    'status',
                                    'type',
                                  ],
                                  type: 'object',
                                },
                                type: 'array',
                              },
                              phase: {
                                description: 'Phase represents the current phase of PersistentVolumeClaim.',
                                type: 'string',
                              },
                            },
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                      type: 'array',
                    },
                  },
                  required: [
                    'count',
                    'name',
                  ],
                  type: 'object',
                },
                minItems: 1,
                type: 'array',
              },
              podDisruptionBudget: {
                description: 'PodDisruptionBudget provides access to the default pod disruption budget for the Elasticsearch cluster. The default budget selects all cluster pods and sets `maxUnavailable` to 1. To disable, set `PodDisruptionBudget` to the empty value (`{}` in YAML).',
                properties: {
                  metadata: {
                    description: 'ObjectMeta is the metadata of the PDB. The name and namespace provided here are managed by ECK and will be ignored.',
                    type: 'object',
                  },
                  spec: {
                    description: 'Spec is the specification of the PDB.',
                    properties: {
                      maxUnavailable: {
                        anyOf: [
                          {
                            type: 'integer',
                          },
                          {
                            type: 'string',
                          },
                        ],
                        description: 'An eviction is allowed if at most "maxUnavailable" pods selected by "selector" are unavailable after the eviction, i.e. even in absence of the evicted pod. For example, one can prevent all voluntary evictions by specifying 0. This is a mutually exclusive setting with "minAvailable".',
                      },
                      minAvailable: {
                        anyOf: [
                          {
                            type: 'integer',
                          },
                          {
                            type: 'string',
                          },
                        ],
                        description: 'An eviction is allowed if at least "minAvailable" pods selected by "selector" will still be available after the eviction, i.e. even in the absence of the evicted pod.  So for example you can prevent all voluntary evictions by specifying "100%".',
                      },
                      selector: {
                        description: 'Label query over pods whose evictions are managed by the disruption budget.',
                        properties: {
                          matchExpressions: {
                            description: 'matchExpressions is a list of label selector requirements. The requirements are ANDed.',
                            items: {
                              description: 'A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values.',
                              properties: {
                                key: {
                                  description: 'key is the label key that the selector applies to.',
                                  type: 'string',
                                },
                                operator: {
                                  description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist.",
                                  type: 'string',
                                },
                                values: {
                                  description: 'values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch.',
                                  items: {
                                    type: 'string',
                                  },
                                  type: 'array',
                                },
                              },
                              required: [
                                'key',
                                'operator',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          matchLabels: {
                            additionalProperties: {
                              type: 'string',
                            },
                            description: 'matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.',
                            type: 'object',
                          },
                        },
                        type: 'object',
                      },
                    },
                    type: 'object',
                  },
                },
                type: 'object',
              },
              remoteClusters: {
                description: 'RemoteClusters enables you to establish uni-directional connections to a remote Elasticsearch cluster.',
                items: {
                  description: 'RemoteCluster declares a remote Elasticsearch cluster connection.',
                  properties: {
                    elasticsearchRef: {
                      description: 'ElasticsearchRef is a reference to an Elasticsearch cluster running within the same k8s cluster.',
                      properties: {
                        name: {
                          description: 'Name of the Kubernetes object.',
                          type: 'string',
                        },
                        namespace: {
                          description: 'Namespace of the Kubernetes object. If empty, defaults to the current namespace.',
                          type: 'string',
                        },
                      },
                      required: [
                        'name',
                      ],
                      type: 'object',
                    },
                    name: {
                      description: 'Name is the name of the remote cluster as it is set in the Elasticsearch settings. The name is expected to be unique for each remote clusters.',
                      minLength: 1,
                      type: 'string',
                    },
                  },
                  required: [
                    'name',
                  ],
                  type: 'object',
                },
                type: 'array',
              },
              secureSettings: {
                description: 'SecureSettings is a list of references to Kubernetes secrets containing sensitive configuration options for Elasticsearch.',
                items: {
                  description: 'SecretSource defines a data source based on a Kubernetes Secret.',
                  properties: {
                    entries: {
                      description: 'Entries define how to project each key-value pair in the secret to filesystem paths. If not defined, all keys will be projected to similarly named paths in the filesystem. If defined, only the specified keys will be projected to the corresponding paths.',
                      items: {
                        description: 'KeyToPath defines how to map a key in a Secret object to a filesystem path.',
                        properties: {
                          key: {
                            description: 'Key is the key contained in the secret.',
                            type: 'string',
                          },
                          path: {
                            description: 'Path is the relative file path to map the key to. Path must not be an absolute file path and must not contain any ".." components.',
                            type: 'string',
                          },
                        },
                        required: [
                          'key',
                        ],
                        type: 'object',
                      },
                      type: 'array',
                    },
                    secretName: {
                      description: 'SecretName is the name of the secret.',
                      type: 'string',
                    },
                  },
                  required: [
                    'secretName',
                  ],
                  type: 'object',
                },
                type: 'array',
              },
              serviceAccountName: {
                description: 'ServiceAccountName is used to check access from the current resource to a resource (eg. a remote Elasticsearch cluster) in a different namespace. Can only be used if ECK is enforcing RBAC on references.',
                type: 'string',
              },
              transport: {
                description: 'Transport holds transport layer settings for Elasticsearch.',
                properties: {
                  service: {
                    description: 'Service defines the template for the associated Kubernetes Service object.',
                    properties: {
                      metadata: {
                        description: 'ObjectMeta is the metadata of the service. The name and namespace provided here are managed by ECK and will be ignored.',
                        type: 'object',
                      },
                      spec: {
                        description: 'Spec is the specification of the service.',
                        properties: {
                          clusterIP: {
                            description: 'clusterIP is the IP address of the service and is usually assigned randomly by the master. If an address is specified manually and is not in use by others, it will be allocated to the service; otherwise, creation of the service will fail. This field can not be changed through updates. Valid values are "None", empty string (""), or a valid IP address. "None" can be specified for headless services when proxying is not required. Only applies to types ClusterIP, NodePort, and LoadBalancer. Ignored if type is ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                            type: 'string',
                          },
                          externalIPs: {
                            description: 'externalIPs is a list of IP addresses for which nodes in the cluster will also accept traffic for this service.  These IPs are not managed by Kubernetes.  The user is responsible for ensuring that traffic arrives at a node with this IP.  A common example is external load-balancers that are not part of the Kubernetes system.',
                            items: {
                              type: 'string',
                            },
                            type: 'array',
                          },
                          externalName: {
                            description: 'externalName is the external reference that kubedns or equivalent will return as a CNAME record for this service. No proxying will be involved. Must be a valid RFC-1123 hostname (https://tools.ietf.org/html/rfc1123) and requires Type to be ExternalName.',
                            type: 'string',
                          },
                          externalTrafficPolicy: {
                            description: 'externalTrafficPolicy denotes if this Service desires to route external traffic to node-local or cluster-wide endpoints. "Local" preserves the client source IP and avoids a second hop for LoadBalancer and Nodeport type services, but risks potentially imbalanced traffic spreading. "Cluster" obscures the client source IP and may cause a second hop to another node, but should have good overall load-spreading.',
                            type: 'string',
                          },
                          healthCheckNodePort: {
                            description: 'healthCheckNodePort specifies the healthcheck nodePort for the service. If not specified, HealthCheckNodePort is created by the service api backend with the allocated nodePort. Will use user-specified nodePort value if specified by the client. Only effects when Type is set to LoadBalancer and ExternalTrafficPolicy is set to Local.',
                            format: 'int32',
                            type: 'integer',
                          },
                          ipFamily: {
                            description: "ipFamily specifies whether this Service has a preference for a particular IP family (e.g. IPv4 vs. IPv6).  If a specific IP family is requested, the clusterIP field will be allocated from that family, if it is available in the cluster.  If no IP family is requested, the cluster's primary IP family will be used. Other IP fields (loadBalancerIP, loadBalancerSourceRanges, externalIPs) and controllers which allocate external load-balancers should use the same IP family.  Endpoints for this Service will be of this family.  This field is immutable after creation. Assigning a ServiceIPFamily not available in the cluster (e.g. IPv6 in IPv4 only cluster) is an error condition and will fail during clusterIP assignment.",
                            type: 'string',
                          },
                          loadBalancerIP: {
                            description: 'Only applies to Service Type: LoadBalancer LoadBalancer will get created with the IP specified in this field. This feature depends on whether the underlying cloud-provider supports specifying the loadBalancerIP when a load balancer is created. This field will be ignored if the cloud-provider does not support the feature.',
                            type: 'string',
                          },
                          loadBalancerSourceRanges: {
                            description: 'If specified and supported by the platform, this will restrict traffic through the cloud-provider load-balancer will be restricted to the specified client IPs. This field will be ignored if the cloud-provider does not support the feature." More info: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/',
                            items: {
                              type: 'string',
                            },
                            type: 'array',
                          },
                          ports: {
                            description: 'The list of ports that are exposed by this service. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                            items: {
                              description: "ServicePort contains information on service's port.",
                              properties: {
                                appProtocol: {
                                  description: 'The application protocol for this port. This field follows standard Kubernetes label syntax. Un-prefixed names are reserved for IANA standard service names (as per RFC-6335 and http://www.iana.org/assignments/service-names). Non-standard protocols should use prefixed names such as mycompany.com/my-custom-protocol. Field can be enabled with ServiceAppProtocol feature gate.',
                                  type: 'string',
                                },
                                name: {
                                  description: "The name of this port within the service. This must be a DNS_LABEL. All ports within a ServiceSpec must have unique names. When considering the endpoints for a Service, this must match the 'name' field in the EndpointPort. Optional if only one ServicePort is defined on this service.",
                                  type: 'string',
                                },
                                nodePort: {
                                  description: 'The port on each node on which this service is exposed when type=NodePort or LoadBalancer. Usually assigned by the system. If specified, it will be allocated to the service if unused or else creation of the service will fail. Default is to auto-allocate a port if the ServiceType of this Service requires one. More info: https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport',
                                  format: 'int32',
                                  type: 'integer',
                                },
                                port: {
                                  description: 'The port that will be exposed by this service.',
                                  format: 'int32',
                                  type: 'integer',
                                },
                                protocol: {
                                  description: 'The IP protocol for this port. Supports "TCP", "UDP", and "SCTP". Default is TCP.',
                                  type: 'string',
                                },
                                targetPort: {
                                  anyOf: [
                                    {
                                      type: 'integer',
                                    },
                                    {
                                      type: 'string',
                                    },
                                  ],
                                  description: "Number or name of the port to access on the pods targeted by the service. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME. If this is a string, it will be looked up as a named port in the target Pod's container ports. If this is not specified, the value of the 'port' field is used (an identity map). This field is ignored for services with clusterIP=None, and should be omitted or set equal to the 'port' field. More info: https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service",
                                },
                              },
                              required: [
                                'port',
                              ],
                              type: 'object',
                            },
                            type: 'array',
                          },
                          publishNotReadyAddresses: {
                            description: "publishNotReadyAddresses, when set to true, indicates that DNS implementations must publish the notReadyAddresses of subsets for the Endpoints associated with the Service. The default value is false. The primary use case for setting this field is to use a StatefulSet's Headless Service to propagate SRV records for its Pods without respect to their readiness for purpose of peer discovery.",
                            type: 'boolean',
                          },
                          selector: {
                            additionalProperties: {
                              type: 'string',
                            },
                            description: 'Route service traffic to pods with label keys and values matching this selector. If empty or not present, the service is assumed to have an external process managing its endpoints, which Kubernetes will not modify. Only applies to types ClusterIP, NodePort, and LoadBalancer. Ignored if type is ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/',
                            type: 'object',
                          },
                          sessionAffinity: {
                            description: 'Supports "ClientIP" and "None". Used to maintain session affinity. Enable client IP based session affinity. Must be ClientIP or None. Defaults to None. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies',
                            type: 'string',
                          },
                          sessionAffinityConfig: {
                            description: 'sessionAffinityConfig contains the configurations of session affinity.',
                            properties: {
                              clientIP: {
                                description: 'clientIP contains the configurations of Client IP based session affinity.',
                                properties: {
                                  timeoutSeconds: {
                                    description: 'timeoutSeconds specifies the seconds of ClientIP type session sticky time. The value must be >0 && <=86400(for 1 day) if ServiceAffinity == "ClientIP". Default value is 10800(for 3 hours).',
                                    format: 'int32',
                                    type: 'integer',
                                  },
                                },
                                type: 'object',
                              },
                            },
                            type: 'object',
                          },
                          topologyKeys: {
                            description: 'topologyKeys is a preference-order list of topology keys which implementations of services should use to preferentially sort endpoints when accessing this Service, it can not be used at the same time as externalTrafficPolicy=Local. Topology keys must be valid label keys and at most 16 keys may be specified. Endpoints are chosen based on the first topology key with available backends. If this field is specified and all entries have no backends that match the topology of the client, the service has no backends for that client and connections should fail. The special value "*" may be used to mean "any topology". This catch-all value, if used, only makes sense as the last value in the list. If this is not specified or empty, no topology constraints will be applied.',
                            items: {
                              type: 'string',
                            },
                            type: 'array',
                          },
                          type: {
                            description: 'type determines how the Service is exposed. Defaults to ClusterIP. Valid options are ExternalName, ClusterIP, NodePort, and LoadBalancer. "ExternalName" maps to the specified externalName. "ClusterIP" allocates a cluster-internal IP address for load-balancing to endpoints. Endpoints are determined by the selector or if that is not specified, by manual construction of an Endpoints object. If clusterIP is "None", no virtual IP is allocated and the endpoints are published as a set of endpoints rather than a stable IP. "NodePort" builds on ClusterIP and allocates a port on every node which routes to the clusterIP. "LoadBalancer" builds on NodePort and creates an external load-balancer (if supported in the current cloud) which routes to the clusterIP. More info: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types',
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                    },
                    type: 'object',
                  },
                  tls: {
                    description: 'TLS defines options for configuring TLS on the transport layer.',
                    properties: {
                      certificate: {
                        description: |||
                          Certificate is a reference to a Kubernetes secret that contains the CA certificate and private key for generating node certificates. The referenced secret should contain the following: 
                           - `tls.crt`: The CA certificate in PEM format. - `tls.key`: The private key for the CA certificate in PEM format.
                        |||,
                        properties: {
                          secretName: {
                            description: 'SecretName is the name of the secret.',
                            type: 'string',
                          },
                        },
                        type: 'object',
                      },
                    },
                    type: 'object',
                  },
                },
                type: 'object',
              },
              updateStrategy: {
                description: 'UpdateStrategy specifies how updates to the cluster should be performed.',
                properties: {
                  changeBudget: {
                    description: 'ChangeBudget defines the constraints to consider when applying changes to the Elasticsearch cluster.',
                    properties: {
                      maxSurge: {
                        description: 'MaxSurge is the maximum number of new pods that can be created exceeding the original number of pods defined in the specification. MaxSurge is only taken into consideration when scaling up. Setting a negative value will disable the restriction. Defaults to unbounded if not specified.',
                        format: 'int32',
                        type: 'integer',
                      },
                      maxUnavailable: {
                        description: 'MaxUnavailable is the maximum number of pods that can be unavailable (not ready) during the update due to circumstances under the control of the operator. Setting a negative value will disable this restriction. Defaults to 1 if not specified.',
                        format: 'int32',
                        type: 'integer',
                      },
                    },
                    type: 'object',
                  },
                },
                type: 'object',
              },
              version: {
                description: 'Version of Elasticsearch.',
                type: 'string',
              },
            },
            required: [
              'nodeSets',
              'version',
            ],
            type: 'object',
          },
          status: {
            description: 'ElasticsearchStatus defines the observed state of Elasticsearch',
            properties: {
              availableNodes: {
                description: 'AvailableNodes is the number of available instances.',
                format: 'int32',
                type: 'integer',
              },
              health: {
                description: 'ElasticsearchHealth is the health of the cluster as returned by the health API.',
                type: 'string',
              },
              phase: {
                description: 'ElasticsearchOrchestrationPhase is the phase Elasticsearch is in from the controller point of view.',
                type: 'string',
              },
              version: {
                description: 'Version of the stack resource currently running. During version upgrades, multiple versions may run in parallel: this value specifies the lowest version currently running.',
                type: 'string',
              },
            },
            type: 'object',
          },
        },
      },
    },
    version: 'v1',
    versions: [
      {
        name: 'v1',
        served: true,
        storage: true,
      },
      {
        name: 'v1beta1',
        served: true,
        storage: false,
      },
      {
        name: 'v1alpha1',
        served: false,
        storage: false,
      },
    ],
  },
  status: {
    acceptedNames: {
      kind: '',
      plural: '',
    },
    conditions: [
    ],
    storedVersions: [
    ],
  },
}
