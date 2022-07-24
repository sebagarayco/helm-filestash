# Helm Chart for Filestash

## Values

| Value                                           | Description                                        | Default                      |
| ----------------------------------------------- | -------------------------------------------------- | ---------------------------- |
| `replicaCount`                                  | Number of filestash pod replicas                   | 1                            |
| `image.repository`                              | Docker image to use                                | docker.io/machines/filestash |
| `image.pullPolicy`                              | Pull policy to use                                 | IfNotPresent                 |
| `image.tag`                                     | Overrides image tag set in chart appVersion        | ""                           |
| `imagePullSecrets`                              | Secret containing docker credentials to pull image | []                           |
| `nameOverride`                                  | Name prefix for created objects                    | filestash                    |
| `ingress.enabled`                               | Whether to create ingress object or not            | false                        |
| `ingress.className`                             | Ingress className to use                           | ""                           |
| `ingress.hosts`                                 | Ingress host                                       | chart-example.local          |
| `ingress.tls.secretName`                        | Secret containing TLS certificate to use           | chart-example-tls            |
| `autoscaling.enabled`                           | Whether to enable HPA or not                       | false                        |
| `autoscaling.minReplicas`                       | Number of minimum replicas when using HPA          | 1                            |
| `autoscaling.maxReplicas`                       | Number of maximum replicas when using HPA          | 4                            |
| `autoscaling.targetCPUUtilizationPercentage`    | %CPU Utilization when using HPA                    | 80                           |
| `autoscaling.targetMemoryUtilizationPercentage` | %Memory Utilization when using HPA                 | 80                           |
| `documentServer.enabled`                        | Whether to deploy deploy document server           | false                        |
| `documentServer.nameOverride`                   | Name prefix for document server objects            | document-server              |
| `documentServer.image.repository`               | Docker image to use                                | onlyoffice/documentserver    |
| `documentServer.image.pullPolicy`               | Pull policy to use                                 | IfNotPresent                 |
| `documentServer.image.tag`                      | Overrides image tag set in chart appVersion        | ""                           |
| `documentServer.replicaCount`                   | Number of document server pod replicas             | 1                            |
| `persistence.filestashState.enabled`            | Create PVC to persist filestash configuration      | false                        |
| `persistence.filestashState.accessMode`         | Volume access mode                                 | ReadWriteOnce                |
| `persistence.filestashState.annotations`        | PVC annotations                                    | (none)                       |
| `persistence.filestashState.storageClass`       | PVC storage cloas                                  | (none)                       |
| `persistence.filestashState.storageSize`        | PVC storage size                                   | 100Mi                        |

## Usage

```shell
helm repo add filestash https://sebagarayco.github.io/helm-filestash

# list the versions available
helm search repo filestash

# check what settings are available
helm inspect values filestash/filestash

# install
helm install filestash filestash/filestash \
        --namespace='filestash' --create-namespace \
```
