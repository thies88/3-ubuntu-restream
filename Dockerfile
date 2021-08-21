FROM 2-ubuntu-base-nginx

ARG BUILD_DATE
ARG VERSION
LABEL build_version="version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Thies88"

RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install -y --no-install-recommends \
	ffmpeg \
	libnginx-mod-rtmp && \

echo "**** cleanup ****" && \
apt-get autoremove -y --purge && \
# Clean more temp/junk files
apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/cache/apt/* \
	/var/tmp/* \
	/var/log/*

# add local files
COPY root/ /

EXPOSE 1935