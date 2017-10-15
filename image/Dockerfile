FROM fedora:26
COPY root /opt/docker/
RUN ["sh", "/opt/docker/run.root.sh"]
USER user
VOLUME /workspace
RUN ["sh", "/opt/docker/run.user.sh"]
ENTRYPOINT ["sh", "/opt/docker/entrypoint.sh"]
CMD []
