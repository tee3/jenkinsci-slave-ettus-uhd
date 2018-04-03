FROM tee3/jenkinsci-jnlp-slave-boostcpp:0.1.0

LABEL maintainer="Thomas Brown <tabsoftwareconsulting@gmail.com>"

# set user for modifying image
USER root

RUN apt-get -q -y update && apt-get -q -y install \
    python-pip \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --branch release_003_010_002_000 https://github.com/EttusResearch/uhd.git "${HOME}/ettus/uhd"
RUN pip install --user mako
WORKDIR ${HOME}/ettus/uhd
RUN rm -rf host/build
RUN mkdir -p host/build
WORKDIR ${HOME}/ettus/uhd/host/build
RUN cmake -DCMAKE_INSTALL_PREFIX=/usr/local ..
RUN make install
RUN ldconfig

# restore user
USER jenkins
