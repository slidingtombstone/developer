#!/bin/sh

mkdir /workspace/${WORKSPACE_NAME} &&
    node /opt/docker/c9sdk/server.js -w /workspace/${WORKSPACE_NAME} "${@}"
