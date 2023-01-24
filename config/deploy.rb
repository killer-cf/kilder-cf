set :application, 'kilder-cf'
set :repo_url, 'https://github.com/killer-cf/kilder-cf.git' # repositório git do seu projeto
set :deploy_to, '/var/www/kilder-cf'
set :rvm_custom_path, "/usr/share/rvm"
set :branch, 'capistrano-deploy'
set :keep_releases, 5
set :user, 'deploy'
set :format, :airbrussh
set :migration_role, :app
set :log_level, :debug
set :pty, true
set :use_sudo, false
set :stage, :production
set :passenger_roles, :app
#set :socket_binding_ip, '127.0.0.1'
#set :socket_binding_port, '3000'

#set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }

append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, "storage", "log", "tmp", "public/system"

namespace :deploy do
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy :restart'
      invoke 'deploy'
    end
  end

  after :finishing, :compile_assets
  after :finishing, :cleanup
end
