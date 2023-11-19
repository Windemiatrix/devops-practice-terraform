FROM --platform=$TARGETPLATFORM ghcr.io/runatlantis/atlantis:v0.26.0

ARG TARGETPLATFORM
ARG TARGETARCH
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM and arch $TARGETARCH" > /log

COPY hacks/auto-backend*.sh /hacks/
COPY atlantis/policies /policies
