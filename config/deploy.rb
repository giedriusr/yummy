set :repository,  'git@bitbucket.org:giedriusr/food-search.git'
set :scm, :git
set :user, 'root'
set :deploy_via, :remote_cache

set :shared_children, %w(
  public/uploads
  public/assets
  tmp/cache
  tmp
)

desc 'Deploy to production (production environment)'
task :production do
  set :application, 'food-search'
  set :environment, 'production'
  set :deploy_to, "/srv/www/#{application}"
  server '78.47.206.148', :app, :web, :db, :primary => true
end

after "deploy", "deploy:update_shared_files"
after "deploy", "deploy:bundle_install"
after "deploy", "passenger:restart"

namespace :deploy do

  desc 'Runs right after checking out the latest revision from source control'
  task :finalize_update, :except => { :no_release => true } do
    shared_children.each do |path|
      full_path = "#{release_path}/#{path}"
      run "rm -rf #{full_path}"
      parent = File.dirname(full_path)
      run "ln -s #{shared_path}/#{path} #{parent}"
    end
  end

   task :update_shared_files, :roles => :web do
    run "ln -s #{shared_path}/config/database.yml #{current_path}/config/database.yml"
    production_log = "log/production.log"
    run "ln -s #{shared_path}/#{production_log} #{current_path}/#{production_log}"
  end

  task :bundle_install, :roles => :web do
    run "cd #{current_path}; bundle install"
  end

  task :prepare_database, :roles => :web do
    run "cd #{current_path}; RAILS_ENV=production bundle exec rake db:create"
    run "cd #{current_path}; RAILS_ENV=production bundle exec rake db:migrate"
  end

  task :migrations, :roles => :web do
    run "cd #{current_path}; RAILS_ENV=production bundle exec rake db:migrate"
  end

  task :start do ; end
  task :stop do ; end
  task :restart do ; end
end

namespace :passenger do
  desc "Restarting Phusion Passenger (Rails Application)"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end
end

namespace :assets do
  desc 'Precompiling assets'
  task :precompile, :roles => :web do
    run "cd #{current_path}; RAILS_ENV=production bundle exec rake assets:precompile"
  end
end

# configuration for RVM to use bundle command via Capistrano
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, '1.9.2'