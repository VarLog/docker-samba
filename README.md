# docker-samba
This repo contains a docker image with samba share.

# How to use

docker run -d --name samba -p 445:445 \
 -v /projects/mobilepdf:/share/mobilepdf \
 -v /projects/ci:/share/ci \
 -v /share/nuget:/share/nuget \
 -v /share/artefacts:/share/artefacts \
 varlog/samba



