#!/bin/sh

mkdir "/home/user/workspace/${WORKSPACE_NAME}" &&
    mkdir "/home/user/workspace/${WORKSPACE_NAME}/project"
    git -C "/home/user/workspace/${WORKSPACE_NAME}/project" init &&
    git -C "/home/user/workspace/${WORKSPACE_NAME}/project" config user.name "${USER_NAME}" &&
    git -C "/home/user/workspace/${WORKSPACE_NAME}/project" config user.email "${USER_EMAIL}" &&
    git -C "/home/user/workspace/${WORKSPACE_NAME}/project" config user.email "${USER_EMAIL}" &&
    node /opt/docker/c9sdk/server.js -w /home/user/workspace/${WORKSPACE_NAME} "${@}"