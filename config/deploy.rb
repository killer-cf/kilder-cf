set :application, 'kilder-cf'
set :repo_url, 'https://github.com/killer-cf/kilder-cf.git' # repositório git do seu projeto
set :deploy_to, '/var/www/kilder-cf'
set :rvm_custom_path, "/usr/share/rvm"
set :branch, 'capistrano-deploy'
set :keep_releases, 5
set :format, :airbrussh
set :migration_role, :app
set :log_level, :debug
append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, "storage", "log", "tmp", "public/system"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"
 
set :nginx_sites_available_path, "/etc/nginx/sites-available"
set :nginx_sites_enabled_path, "/etc/nginx/sites-enabled"

namespace :puma do
  desc 'Create Puma dirs'
  task :create_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  desc "Restart Nginx"
  task :nginx_restart do
    on roles(:app) do
      execute "sudo service nginx restart"
    end
  end

  before 'bundler:install', :create_dirs
  after 'deploy:finished', :nginx_restart
end
