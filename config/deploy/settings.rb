default_run_options[:pty] = true

# SSH
set :ssh_options, { forward_agent: true }
set :user, "www" # SSH user to connect with, make sure the server has your personal ssh in its ~/.ssh/authorized_keys
set :git_shallow_clone, 1

set :scm, :git

set :application, "projettest"
set :repository,  "git@github.com:GuillaumeDuez/projettest.git"
set :releases,       ['current']
ssh_options[:port] = 443