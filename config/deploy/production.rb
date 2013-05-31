set :rails_env, 'production'
set :deploy_to, "/var/rails_app/projettest" # the project folder on the server, without current/ folder

# defining the server, the easy way
server "162.13.11.237", :app, :web, :db, :primary => true

# another way to way to configure one or many servers is to use roles
# # main
# role :app, 'lolcat.nectify.com'
#
# # resque workers
# role :workers, 'lolcat.nectify.com'
# role :workers, 'ninja.nectify.com'
# role :workers, 'bear.nectify.com'
#
# # resque workers
# role :scheduler, 'lolcat.nectify.com'
#
# # web front end
# role :web, 'bear.nectify.com'
#
# # db
# role :db, 'ninja.nectify.com', :primary => true


set :branch, "origin/master" # the branch to deploy