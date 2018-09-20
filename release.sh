rake compile

mkdir -p /tmp/mruby-docker
cp mruby/bin/mruby /tmp/mruby-docker
cp -r mrblib/ /tmp/mruby-docker

# build archive
tar -C /tmp/ -czf /tmp/mruby-docker.tgz mruby-docker
