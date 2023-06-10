#!/bin/bash

repo_url=https://hub.docker.com/v2/repositories
#        https://hub.docker.com/v2/repositories/fluent/fluentd/tags/?page_size=100

image_name=$1
TOKEN='Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsInJvbGUiOjEsInNjb3BlIjoiZGVmYXVsdCIsImV4cCI6MTY4NjA0NjcxOX0.uRQugNLi-g3PC4hsTy6dJHAPKDj2v_I-u7O6K6yjYGk'
out_json=$2

if [ -z "$out_json" ];then
    curl -s -H "Authorization: ${TOKEN}" ${repo_url}/${image_name}/tags?page_size=100 | jq '.results[]["name"]' | sed 's/\"//g' | sort -u
else
    curl -s -H "Authorization: ${TOKEN}" ${repo_url}/${image_name}/tags?page_size=100 | jq .results
fi

# 

# curl -L -s https://hub.docker.com/v2/repositories/library/apache/impala}/tags?page_size=10 | jq '.results[]["name"]'
# curl -s -H "Authorization: JWT ${TOKEN}" https://hub.docker.com/v2/repositories/fluent/fluentd/tags/?page_size=100 | jq
# curl -s -H "Authorization: Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhZG1pbiIsInJvbGUiOjEsInNjb3BlIjoiZGVmYXVsdCIsImV4cCI6MTY4NjA0NjcxOX0.uRQugNLi-g3PC4hsTy6dJHAPKDj2v_I-u7O6K6yjYGk" https://hub.docker.com/v2/repositories/fluent/fluentd/tags/?page_size=100

# docker search apache/impala --no-trunc -f stars=0