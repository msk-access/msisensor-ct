################## Base Image ##########

FROM ubuntu:18.04

################## ARGUMENTS/Environments ##########
ARG BUILD_DATE
ARG BUILD_VERSION
ARG LICENSE="Apache-2.0"
ARG MSISENSOR_CT_VERSION

################## METADATA ########################
LABEL org.opencontainers.image.vendor="MSKCC"
LABEL org.opencontainers.image.authors="Carmelina Charalambous (charalk@mskcc.org)"


LABEL org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.version=${BUILD_VERSION} \
    org.opencontainers.image.licenses=${LICENSE} \
    org.opencontainers.image.version.msisensorct=${MSISENSOR_CT_VERSION} \
    org.opencontainers.image.vcs-url="https://github.com/msk-access/msisensor-ct.git"

LABEL org.opencontainers.image.description="This container has the base image to build msk-access version of MSIsensor-ct ${MSISENSOR_CT_VERSION}"

################## INSTALL ##########################
WORKDIR /
ADD . /
RUN apt-get update && apt-get install -y git make build-essential liblzma-dev libbz2-dev zlib1g-dev libncurses5-dev libncursesw5-dev

# Copy project
ADD . /
CMD ["bash"]


