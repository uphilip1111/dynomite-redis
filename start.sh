#!/bin/bash

redis-server /etc/redis/redis.conf
/dynomite/src/dynomite -c /redis_single.yml
