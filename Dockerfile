FROM alpine
RUN apk add --no-cache build-base autoconf automake libtool wget

ARG MP4FPSMOD_VERSION="0.26"
RUN wget "https://github.com/nu774/mp4fpsmod/archive/refs/tags/v$MP4FPSMOD_VERSION.zip" && \
    unzip v${MP4FPSMOD_VERSION}.zip && \
    cd mp4fpsmod-${MP4FPSMOD_VERSION} && \
    ./bootstrap.sh && \
    ./configure --disable-silent-rules && \
    make && \
    strip mp4fpsmod && \
    make install
