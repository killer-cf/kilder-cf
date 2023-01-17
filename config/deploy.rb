set :application, 'kilder-cf'
set :repo_url, 'https://github.com/killer-cf/kilder-cf.git' # repositório git do seu projeto
set :deploy_to, '/var/www/kilder-cf'
set :rvm_custom_path, "/usr/share/rvm"
set :branch, 'capistrano-deploy'
set :keep_releases, 5
set :format, :airbrussh
set :migration_role, :app
set :log_level, :debug
set :user, 'deploy'
set :pty,             true
#set :use_sudo,        false
set :stage,           :production
append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, "storage", "log", "tmp", "public/system"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord
 
set :nginx_sites_available_path, "/etc/nginx/sites-available"
set :nginx_sites_enabled_path, "/etc/nginx/sites-enabled"


