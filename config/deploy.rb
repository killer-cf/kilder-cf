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
set :rvm_ruby_version, '3.1.0'
set :rails_env, 'production'
append :linked_files, "config/database.yml", "config/master.key"
append :linked_dirs, "storage", "log", "tmp", "public/system"

namespace :deploy do
  Rake::Task["passenger:restart"].clear_actions
  desc 'restarting app'
  task :restart do
    on roles(:app) do
      echo 'restart app on machine with /etc/init.d/passenger-kilder-cf.sh restart kilder-cf 3000'
    end
  end

  after :finishing, :compile_assets
  after :finishing, :cleanup
end
