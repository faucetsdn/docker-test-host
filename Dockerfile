# Image name: faucet/test-host

# Note that mininet is extremeley persnickity about the underlying versions, since small changes in
# command output will break the mininet parsing. E.g., different verions of 'ping' will have slightly
# different output that cause the tests to fail (on debian). Or, on alpine the '/bin/sh' program
# would output excess control-characters that confused mininet yet again.
#
# This host is built on top of ubuntu which is the same as the base-test image so should be most stable.
#

FROM debian:bookworm

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y net-tools iproute2 iputils-ping \
# Add a marker in so that the unit tests can tell this is a container.
    && echo faucet-test-host > /root/test_marker.txt \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Cmd to run when activated
CMD echo "hello faucet"
