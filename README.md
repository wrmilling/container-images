# Container Images

Kubernetes tailored container images for various applications, hosted on Github Container Registry.

Applications are checked every several hours for new releases.

## Purpose

The goal of these images is to support:

- semantic versioning
- multiple architectures (`amd64`/`arm64`)
- Kubernetes [Security Contexts](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) over using `s6-overlay`
- only using `ubuntu:focal` as the base image

## Images

As of 2021/02/09 GitHub does not provide a nice way to browse Docker images in their Container Registry (GHCR). However it's not hard to figure out what the tag would be for the images we have here.

Each image will consist of `ghcr.io/k8s-at-home/`, then the app name in the folder structure above `radarr` and then the tag from the `.version` file in the `radarr` directory prefixed with a `:v`. Put this together and this is what you'll get `ghcr.io/k8s-at-home/radarr:v3.0.2.4552`

We will update once there is a much nicer way of browsing or search for image tags.

## Configuration

Most of these images can be used as drop-in-replacements for the images in our k8s-at-home [Helm charts](https://github.com/k8s-at-home/charts/).

## Permissions

These images are using user and group ids of `568`. This cannot be changed at the container runtime.

With that said however there are two methods you can use to make these containers have write access to your file storage:

1. Changing the Kubernetes [Security Contexts](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) to allow the container to have permissions to write to your file storage. In our [Helm charts](https://github.com/k8s-at-home/charts/) this can be accomplished by setting the `podSecurityContext.runAsUser`, `podSecurityContext.runAsGroup`, and `podSecurityContext.fsGroup` values to your required user / group ids.

2. Access the volume's data without the pod running and running `chown -R 568:568 <path-to-your-volume>`.  This step can be a bit complicated if you are not very familiar with your storage interface.

### Environment Variables

|      Name      | Default | Description                                       |
|:--------------:|:-------:|---------------------------------------------------|
|    `UMASK`     | `0002`  | Set the default creation permission mode of files |
| `WAIT_FOR_VPN` | `false` |                                                   |
|  `EXTRA_ARGS`  |         | Additional arguments to pass to the application   |
|      `TZ`      |  `UTC`  | Timezone (e.g. `America/New_York`)                |

### Volumes

|   Path    | Description                         |
|:---------:|-------------------------------------|
|  `/app`   | Application install directory       |
| `/config` | Application configuration directory |
