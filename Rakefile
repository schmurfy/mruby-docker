MRUBY_CONFIG = File.expand_path('../build_config.rb', __FILE__)

task :default => :compile

file :mruby do
  sh "git clone -b 1.4.1 --depth=1 git://github.com/mruby/mruby.git"
end

desc "compile binary"
task :compile => :mruby do
  sh "cd mruby && MRUBY_CONFIG=#{MRUBY_CONFIG} rake all"
end

desc "clean"
task :clean => :mruby do
  sh "cd mruby && MRUBY_CONFIG=#{MRUBY_CONFIG} rake clean"
end

task :debug => :compile do
  puts ""
  exec "lldb ./mruby/bin/mruby client.rb ./examples/example1.rb"
end

task :run => :compile do
  puts ""
  exec "./mruby/bin/mruby mrblib/main.rb ./examples/example1.rb"
end
