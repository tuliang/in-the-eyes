# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "in_the_eyes"
set :repo_url, "https://github.com/tuliang/in-the-eyes.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/www/in_the_eyes"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure


namespace :deploy do

  task :update do
    on roles(:web), in: :sequence, wait: 3 do
      within release_path do
        execute "cd #{release_path}/build_image/in-the-eyes && git checkout master && git pull"

        # sudo "cd '#{release_path}/build_image/in-the-eyes' && sh scripts/build-image"
        sudo "curl -sSL https://raw.githubusercontent.com/tuliang/in-the-eyes/master/scripts/build-image | bash"

        # execute "sudo -i"

        # execute "cd #{release_path}/build_image/in-the-eyes"

        # execute "cd '#{release_path}/build_image/in-the-eyes' && docker-compose stop app"
        # execute "cd '#{release_path}/build_image/in-the-eyes' && docker-compose up -d app"
      end
    end
  end

  task :restart do
    on roles(:web), in: :sequence, wait: 3 do
      within release_path do
      	execute "cd #{release_path}"

        sudo "docker-compose stop"
        sudo "docker-compose up -d"
      end
    end
  end

  task :install do
    on roles(:web), in: :sequence, wait: 3 do
      within release_path do
        execute "cd #{release_path}"

        install_docker
        docker_build
        install_db
      end
    end
  end

  task :build do
    on roles(:web), in: :sequence, wait: 3 do
      within release_path do
        execute "cd #{release_path}"

        docker_build
        install_db
      end
    end
  end

  def docker_build
    sudo "docker-compose build"
    sudo "docker-compose up -d"
  end

  def restart_app
    sudo "docker-compose stop app"
    sudo "docker-compose up -d app"
  end

  def install_docker
    sudo "curl -sSL https://raw.githubusercontent.com/tuliang/in-the-eyes/master/scripts/install-docker | bash"
    
    sudo "docker-compose --version"
  end

  def install_db
  	sudo "docker-compose run app bundle exec rails db:create RAILS_ENV=production"
  	sudo "docker-compose run app bundle exec rails db:migrate RAILS_ENV=production"
  	sudo "docker-compose run app bundle exec rails db:seed RAILS_ENV=production"
  end
end