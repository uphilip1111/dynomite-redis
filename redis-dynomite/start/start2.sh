#!/bin/bash

redis-server /etc/redis/redis.conf
/dynomite/src/dynomite -c /dynomite/conf/redis_rack2_node.yml
