set :application, 'kilder-cf'
set :repo_url, 'https://github.com/killer-cf/kilder-cf.git' # repositório git do seu projeto
set :deploy_to, '/var/www/kilder-cf'
set :rvm_path, '/usr/local/rvm'
set :branch, 'main'
set :keep_releases, 5
set :format, :airbrussh
set :log_level, :debug
append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, "storage", "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"