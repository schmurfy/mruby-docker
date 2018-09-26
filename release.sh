if [[ $# != 1 ]]; then
  echo "Usage: $0 <version>"
  exit 0
fi

rake compile

mkdir -p /tmp/mruby-docker
cp mruby/bin/mruby /tmp/mruby-docker
cp -r mrblib/ /tmp/mruby-docker

# build archive
tar -C /tmp/ -czf /dd/mruby-docker-$1.tgz mruby-docker
