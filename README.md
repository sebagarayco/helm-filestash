# Helm Chart for Filestash

⚠️  Archived and moved to [https://github.com/sebagarayco/helm-charts](https://github.com/sebagarayco/helm-charts).

Based on the image built from :unicorn: https://github.com/mickael-kerjean/filestash.

## Usage

See [here](charts/filestash/README.md) for all configuration options.

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
