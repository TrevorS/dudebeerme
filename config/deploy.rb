# dudebeer.me deploy.rb
#
# rbenv / capistrano settings:
# http://henriksjokvist.net/archive/2012/2/deploying-with-rbenv-and-capistrano/
#
# database.yml symlink settings:
# http://stackoverflow.com/questions/9684649/capistrano-cant-deploy-my-database-yml

# we are going to use bundler to handle gems
require 'bundler/capistrano'

# set the bundle flags
set :bundle_flags, '--deployment --quiet --binstubs --shebang ruby-local-exec'

# set the path to the bundle executable
set (:bundle_cmd) { "/home/nginx/.rbenv/shims/bundle" }

# add the rbenv shims and bin locations to the path
set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

# set the application name
set :application, 'dudebeerme'

# set the git repository location
set :repository,  'git@github.com:TrevorS/dudebeerme.git'

# set the git user name
set :scm_username, 'TrevorS'

# set up the dudebeer.me target for app, web, and db
server 'dudebeer.me', :app, :web, :db

# set up the deployment location
set :deploy_to, '/var/webapps/dudebeerme'

# set deployment username
set :user, 'nginx'

# turn off sudo
set :use_sudo, false

# turn on git mode
set :scm, :git

# turn on agent forwarding
ssh_options[:forward_agent] = true

# set branch to check out during deployment
set :branch, 'master'

# prevent a full repo clone every time
set :deploy_via, :remote_cache

# make ssh password prompt work
default_run_options[:pty] = true

# set up phusion passenger
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# run the database config symlink after deploying
before "deploy:assets:precompile" do
  run ["ln -nfs #{shared_path}/config/settings.yml #{release_path}/config/settings.yml",
       "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml",
       "ln -fs #{shared_path}/uploads #{release_path}/uploads"
  ].join(" && ")
end
