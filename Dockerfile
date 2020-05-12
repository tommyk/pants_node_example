FROM ubuntu
RUN apt-get update && apt-get install curl python3 python3-distutils python3-dev gcc git openjdk-11-jdk-headless -y
RUN mkdir /work
WORKDIR /work
RUN curl -L -O https://pantsbuild.github.io/setup/pants && chmod +x pants \
    && ./pants --version
RUN git clone https://github.com/pantsbuild/pants.git pants_source_ignore
RUN cd pants_source_ignore && git checkout 1.26 && cd ..
RUN cp -r pants_source_ignore/contrib/node/examples/* .
RUN echo "\
[GLOBAL]\n\
pants_version: 1.26.0\n\
plugins: ['pantsbuild.pants.contrib.node==%(pants_version)s']\n\
[source]\n\
source_roots: {'src/node': ['node']}" >> pants.ini
RUN ls -al



