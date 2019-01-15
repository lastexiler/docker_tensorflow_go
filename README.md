# Dockerize Tensorflow with Golang
This work is one example to build basic "tensorflow with golang" image.

Golang (1.11.4) and Tensorflow cpu-linux c lib (1.12.0) will be built from offical tensorflow docker image (tensorflow/tensorflow:1.12.0) 

## How to build the image
```bash
$ docker build -t tensorflow_go:latest -f Dockerfile .
```

## How to use the docker image
As described in the TF homepage, https://www.tensorflow.org/install/lang_c

Before use the built docker image, you should create the linkage between TF c lib with your application.
To configure the linker with ldconfig,
```bash
$ sudo ldconfig
```

## Other proposal
It is not easy to dockerize TF with Go, one suggestion is to use "Tensorflow Serving" with Docker. https://www.tensorflow.org/serving/docker
Which is made for providing service in production.
