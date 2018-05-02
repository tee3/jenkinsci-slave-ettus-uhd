FROM tee3/jenkinsci-slave-eigen:0.0.1

LABEL maintainer="Thomas Brown <tabsoftwareconsulting@gmail.com>"

USER root

RUN dnf -y update && dnf -y install \
    git \
    pkg-config \
    python \
    python-devel \
    python-pip \
    zeromq-devel

# Clone, build, and install uhd
RUN git clone --branch v3.11.0.0 https://github.com/ettusresearch/uhd /tmp/uhd && \
    \
    pip install --user mako && \
    pip install --user requests && \
    rm -rf /tmp/uhd/host/build && \
    mkdir /tmp/uhd/host/build && \
    cd /tmp/uhd/host/build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local \
        -DENABLE_C_API=OFF \
        -DENABLE_EXAMPLES=OFF \
        -DENABLE_UTILS=OFF \
        -DENABLE_TESTS=OFF \
        -DENABLE_MANUAL=OFF \
        -DENABLE_MAN_PAGES=OFF \
        -DENABLE_DOXYGEN=OFF \
        -DENABLE_USB=OFF \
        -DENABLE_GPSD=OFF \
        -DENABLE_E300=OFF \
        -DENABLE_N230=OFF \
        -DENABLE_MPMD=OFF \
        -DENABLE_OCTOCLOCK=OFF \
        /tmp/uhd/host && \
    cmake --build . && \
    cmake --build . --target install && \
    ldconfig /usr/local/lib64 && \
    cd / && \
    rm -rf /tmp/uhd && \
    pip uninstall -y mako && \
    pip uninstall -y requests

USER jenkins
