FROM tensorflow/tensorflow:1.12.0

# set up environment
ENV GOROOT /usr/local/go
ENV GOPATH /go
ENV PATH $PATH:$GOROOT/bin
ENV TARGET_TF_DIR /usr/local

# golang env
ENV GOLANG_VERSION 1.11.4
ENV GOLANG_PK go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_PK_URL https://dl.google.com/go/$GOLANG_PK

# tensorflow env
ENV TENSORFLOW_VER 1.12.0
ENV TENSORFLOW_C_LIB libtensorflow-cpu-linux-x86_64-$TENSORFLOW_VER.tar.gz
ENV TENSORFLOW_LIB_URL https://storage.googleapis.com/tensorflow/libtensorflow/$TENSORFLOW_C_LIB

# install essential
RUN apt-get update && apt-get upgrade -y && \
    apt-get install build-essential && \
    apt-get install wget

# install golang and tensorflow
RUN mkdir $GOPATH && \
    cd $GOPATH && \
    wget $GOLANG_PK_URL && \
    tar -xvf $GOLANG_PK && \
    mv go $TARGET_TF_DIR && \
    wget $TENSORFLOW_LIB_URL && \
    tar -xvf $TENSORFLOW_C_LIB -C $TARGET_TF_DIR && \
    go version