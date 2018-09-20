

# Compile on fresh alpine
$ apk add --no-cache git ruby ruby-dev gcc musl-dev pcre-dev binutils bison
$ gem install --no-ri --no-rdoc rake

$ rake



# Goals

- connects to multiple docker api to monitor multiple hosts
- register container on consul
- uses consul to fetch containers infos
- generate one or more config files when changes occur
