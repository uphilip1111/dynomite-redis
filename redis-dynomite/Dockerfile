#
# Redis Dockerfile
#
# https://github.com/dockerfile/redis
#

# Pull base image.
FROM library/ubuntu

# Install Redis.
RUN apt-get update && apt-get install -y wget \
  make \
  vim \
  htop \
  gcc && \
  cd /tmp && \
  wget http://download.redis.io/redis-stable.tar.gz && \
  tar xvzf redis-stable.tar.gz && \
  cd redis-stable && \
  make && \
  make install && \
  cp -f src/redis-sentinel /usr/local/bin && \
  mkdir -p /etc/redis && \
  cp -f *.conf /etc/redis && \
  rm -rf /tmp/redis-stable* && \
  sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf && \
  sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf

ENV TZ=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN  apt-get update && apt-get install -y \
	autoconf \
	build-essential \
	dh-autoreconf \
	git \
	libssl-dev \
	libtool \
	software-properties-common \
	tcl8.5

COPY ./dynomite /dynomite

RUN cd /dynomite && \
    autoreconf -fvi && \
    ./configure --enable-debug=yes && \
    make
#RUN  wget -O dynomite.tar.gz https://github.com/Netflix/dynomite/archive/v0.6.6.tar.gz && \
#  tar xvzf dynomite.tar.gz && \
#  cd dynomite-0.6.6 && \
#  autoreconf -fvi && \
#  ./configure --enable-debug=yes && \
#  make && \
#  src/dynomite -h
# copy config files
COPY ./configs/redis.service /etc/systemd/system/redis.service
COPY ./configs/sysctl.conf /etc/sysctl.conf
COPY ./configs/rc.local /etc/rc.local
COPY ./configs/redis.4.0.2.conf /etc/redis/redis.conf
COPY ./configs/sentinel.conf /etc/redis/sentinel.conf
COPY ./dynomite-config /dynomite/conf/
COPY ./start /start
# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
#CMD ["redis-server", "/etc/redis/redis.conf"]
#CMD ["/dynomite/src/dynomite", "-c", "/redis_single.yml"]
CMD ["/start/start.sh"]
# Expose ports.
EXPOSE 6379 26379 8102 22221 8101
