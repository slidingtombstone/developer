#!/bin/sh
# This file is part of cloud9.
#
#    cloud9 is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    cloud9 is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with cloud9 .  If not, see <http://www.gnu.org/licenses/>.

ssh-keygen -f /root/.ssh/id_rsa -P "" &&
    docker \
        container \
        exec \
        --interactive \
        ${SSHD_CONTAINER} \
        ssh-keyscan sshd | tee /root/.ssh/known_hosts &&
    chmod 0755 /root/.ssh/known_hosts &&
    SSHD_PORT=$(cat /root/.ssh/id_rsa.pub | \
        docker \
        container \
        exec \
        --interactive \
        ${SSHD_CONTAINER} \
        sh /opt/docker/reserve-ports.sh) &&
    sleep 1s &&
    rm -f /root/.ssh/known_hosts &&
    (nohup ssh -i /root/.ssh/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -fN -R 127.0.0.1:${SSHD_PORT}:127.0.0.1:8181 sshd </dev/null >/tmp/sshd1.log 2>&1 &) &&
    rm -f /root/.ssh/known_hosts &&
    (nohup ssh -i /root/.ssh/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -fN -L 0.0.0.0:80:0.0.0.0:${SSHD_PORT} sshd </dev/null >/tmp/sshd2.log 2>&1 &) &&
    chown --recursive user:user /workspace/$(ls -1 /workspace)
