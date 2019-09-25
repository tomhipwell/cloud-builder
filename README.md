# Cloud Build

A base image for running terraform against Google cloud resources.

## Getting started

Build the image and then run the container:

```shell
docker image build -t cloud-builder .
docker run -it cloud-builder:latest
```

## Linting

I'd recommend using hadolint to lint your docker files so you follow best practice and avoid syntax errors or security issues.

```shell
brew install hadolint
```

There's a nice plugin as well for VSCode, or you can run it from the command line using:

```shell
hadolint Dockerfile
```

## Manually deploying the image during test

Once built, you can manually deploy your image to test it out.

Firstly, configure docker to use gcloud as a credential helper:

```shell
gcloud auth configure-docker
```

Then tag your docker image with the container registry name, for example:

```shell
docker tag cloud-builder eu.gcr.io/"$PROJECT"/cloud-builder
```

Push the tagged image to the container registry:

```shell
docker push eu.gcr.io/"$PROJECT"/cloud-builder
```
