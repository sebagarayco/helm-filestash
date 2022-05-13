# Helm Chart for Filestash

## Values

| Value                                           | Description                                        | Default                      |
| ----------------------------------------------- | -------------------------------------------------- | ---------------------------- |
| `replicaCount`                                  | Number of pod replicas                             | 1                            |
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

## Usage

```shell
helm repo add filestash https://sebagarayco.github.io/filestash

# list the versions available
helm search repo filestash

# check what settings are available
helm inspect values filestash/filestash

# install
helm install filestash filestash/filestash \
        --namespace='filestash' --create-namespace \
```
