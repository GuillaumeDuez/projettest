set :normal_symlinks, %w(
  config/database.yml
  bundle
  log
)

set :weird_symlinks, {}

namespace :deploy do
  desc "Make all the damn symlinks"
  task :create_symlink, :roles => :app, :except => { :no_release => true } do
    commands = normal_symlinks.map do |path|
      "rm -rf #{release_path}/#{path} && \
       ln -s #{shared_path}/#{path} #{release_path}/#{path}"
    end

    commands += weird_symlinks.map do |from, to|
      "rm -rf #{release_path}/#{to} && \
       ln -s #{shared_path}/#{from} #{release_path}/#{to}"
    end

    # needed for some of the symlinks
    run "mkdir -p #{current_path}/tmp"

    run <<-CMD
      cd #{release_path} &&
      #{commands.join(" && ")}
    CMD
  end
end