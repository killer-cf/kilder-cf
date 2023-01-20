require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"
require 'Capistrano/passenger'
require "capistrano/rails"
require "capistrano/rvm"
require "capistrano/bundler"

install_plugin Capistrano::SCM::Git

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
