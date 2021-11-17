Container meant to run as a Kube cronjob to update the profiles collection nightly with new data.

## Build & Release Process

Builds follow our usual base / head structure:

 - Base image: `docker image build --target base argovis/datacron:base-<yymmdd>`
 - Run image: `docker image build --target head argovis/datacron:<major.minor.patch>`

Push both to `https://hub.docker.com/repository/docker/argovis/datacron` when ready to release.

Code releases are simple releases off of `main`, tagged with the same semver as the run image.

## Usage

`cronjob.yaml` is meant to be deployed on OKD to update the database nightly.