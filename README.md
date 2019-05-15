# gscout
This is a container version of the gscout utility from [here](https://www.nccgroup.trust/us/about-us/newsroom-and-events/blog/2017/august/introducing-g-scout/).

It is specifically aimed at running gscout against a single project, not multiple, not organisations, as this was my use case.

## Use
Pretty simple really:

 - `docker container run --user="root" -v {RESULT_DIR_HOST_MACHINE}:/opt/gscoutt/Report\ Output --rm -e {YOUR_G_SCOUT_KEY} -e {YOUR_PROJECT} sree96/g-scout-alpine`

### Authentication
gscout requires a service account with the `Viewer` and `Cloud Security Scanner Runner` to run.

