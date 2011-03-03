set :application, "skillmaster"
set :repository,  "dq@dansrc.com:/home/dq/gitsrc/#{application}.git"  # "someuser@somehost:/home/myproject"
set :user, "dq"
set :domain, "dansrc.com"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/dq/#{application}.dansrc.com/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :deploy_via, :remote_cache  # if your server has direct access to the repository
#set :deploy_via, :copy  # if you server does NOT have direct access to the repository (default)
set :git_shallow_clone, 1  # only copy the most recent, not the entire repository (default:1)

set :keep_releases, 3  # only keep a current and one previous version to save space

role :app, domain
role :web, domain
role :db,  domain, :primary => true

ssh_options[:paranoid] = false

# Necessary to run on Site5
set :use_sudo, false
set :group_writable, false

default_run_options[:pty] = true

set :runner, nil
set :rails_env, "production"

task :set_permissions do
  donothing = true
end

#rake db:migrate RAILS_ENV=production

task :bundle, :roles => :app do
  run "cd #{current_path}; bundle install --path vendor/bundle"
end

namespace :deploy do
  after "deploy:update", :bundle

  desc "Site5 version of restart task."
  task :restart do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end
end