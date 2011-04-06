set :application, "skillmaster"
set :repository,  "dq@dansrc.com:/home/dq/gitsrc/#{application}.git"  # "someuser@somehost:/home/myproject"
set :user, "dq"

server "dansrc.com", :app, :web, :db, :primary => true

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/#{user}/#{application}.dansrc.com/#{application}"
