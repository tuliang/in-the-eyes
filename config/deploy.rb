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

  task :update_nginx do
    on roles(:web), in: :sequence, wait: 3 do
      within release_path do
        sudo "curl -sSL https://raw.githubusercontent.com/tuliang/in-the-eyes/master/scripts/update_nginx | bash"
      end
    end
  end

  task :update do
    on roles(:web), in: :sequence, wait: 3 do
      within release_path do
        sudo "curl -sSL https://raw.githubusercontent.com/tuliang/in-the-eyes/master/scripts/update | bash"
      end
    end
  end

  task :seed do
    on roles(:web), in: :sequence, wait: 3 do
      within release_path do
        sudo "curl -sSL https://raw.githubusercontent.com/tuliang/in-the-eyes/master/scripts/seed | bash"
      end
    end
  end

  task :restart do
    on roles(:web), in: :sequence, wait: 3 do
      within release_path do
        sudo "curl -sSL https://raw.githubusercontent.com/tuliang/in-the-eyes/master/scripts/restart | bash"
      end
    end
  end

  task :install do
    on roles(:web), in: :sequence, wait: 3 do
      within release_path do
        install_docker

        init
      end
    end
  end

  task :init do
    on roles(:web), in: :sequence, wait: 3 do
      within release_path do
        init
      end
    end
  end

  task :stop do
    on roles(:web), in: :sequence, wait: 3 do
      within release_path do
        stop
      end
    end
  end

  def stop
    sudo "curl -sSL https://raw.githubusercontent.com/tuliang/in-the-eyes/master/scripts/stop | bash"
  end

  def init
    sudo "curl -sSL https://raw.githubusercontent.com/tuliang/in-the-eyes/master/scripts/init | bash"
  end

  def install_docker
    sudo "curl -sSL https://raw.githubusercontent.com/tuliang/in-the-eyes/master/scripts/install-docker | bash"
    
    sudo "docker-compose --version"
  end
end