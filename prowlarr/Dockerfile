FROM debian as base
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    curl &&                              \
    apt-get clean &&                     \
    rm -rf /var/lib/apt/

FROM base as build
WORKDIR /
RUN curl                                                                                               \
    -o prowlarr.tar.gz                                                                                 \
    -L 'http://prowlarr.servarr.com/v1/update/develop/updatefile?os=linux&runtime=netcore&arch=x64' && \
    tar -xf prowlarr.tar.gz

FROM base
WORKDIR /app
RUN apt-get update && apt-get install -y \
    libicu67                             \
    sqlite3 &&                           \
    apt-get clean &&                     \
    rm -rf /var/lib/apt/
COPY --from=build /Prowlarr/ /app/
RUN ln -sf /app/Prowlarr /usr/local/bin
CMD ["Prowlarr"]