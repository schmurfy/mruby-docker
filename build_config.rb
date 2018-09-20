# mydir = File.expand_path('../', __FILE__)

MRuby::Build.new do |conf|
  toolchain :gcc
  # enable_debug
  # conf.enable_test
  
  local_dev = false
  
  cc.defines << "MRB_INT64"
  
  conf.gem github: 'schmurfy/mruby-http'
  
  conf.gem github: 'schmurfy/mruby-mongoose' do |conf|
    cc.defines << "MG_DISABLE_SOCKETPAIR" # mg_broadcast
    cc.defines << "MG_DISABLE_CGI" # requires MG_DISABLE_SOCKETPAIR
    cc.defines << "MG_DISABLE_DIRECTORY_LISTING"
    cc.defines << "MG_DISABLE_DAV"
    cc.defines << "MG_DISABLE_SSI"
  end

  conf.gem :core => 'mruby-bin-mruby'
  conf.gem :core => 'mruby-print'
  conf.gem :core => 'mruby-io'

  conf.gem :github => 'iij/mruby-dir'
  conf.gem :github => 'mattn/mruby-json'
  conf.gem :github => 'mattn/mruby-pcre-regexp'
  conf.gem :github => 'pbosetti/mruby-merb'
  
  # utility gems, not used directly by core  
  conf.gem :github => 'iij/mruby-env'


  # include the default GEMs
  conf.gembox 'default'
  
  conf.gem :github => 'iij/mruby-require'
end
