ARG VERSION=kinetic
FROM ros:${VERSION}

RUN apt-get update -qq && \
    apt-get install -y build-essential cmake git libboost-system-dev libboost-thread-dev libgtest-dev python-catkin-tools vim && \
    cd /usr/src/gtest && \
    cmake CMakeLists.txt && \
    make && \
    cp *.a /usr/lib && \
    cd && \
    mkdir catkin_ws/src -p && \
    cd catkin_ws && \
    catkin init && \
    cd src && \
    git clone https://github.com/autonomylab/libcreate.git && \
    git clone https://github.com/autonomylab/create_autonomy.git && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

