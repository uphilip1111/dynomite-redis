#!/bin/bash

redis-server /etc/redis/redis.conf
/dynomite/src/dynomite -c /dynomite/conf/dc2_rack1_node.yml
