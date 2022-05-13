# Helm Chart for Filestash

Based on the image built from https://github.com/mickael-kerjean/filestash.

## Usage

See [here](charts/filestash/README.md) for all configuration options.

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
