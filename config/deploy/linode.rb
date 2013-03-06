namespace :linode do

  task :setup do
    setup_system
    setup_ruby
  end

  task :setup_system do
    update_apt_get
    install_dev_tools
    install_git
    install_dependencies
    install_nginx
    install_sqlite3
    install_postgresql
    install_imagemagick
    set_permissions
  end

  task :setup_ruby do
    install_rvm
    install_ruby
    install_rdoc_and_bundler
  end

  task :setup_db do
  end

  desc "Update apt-get sources."
  task :update_apt_get do
    sudo "apt-get update", :shell => 'bash'
  end

  desc "Install development tools."
  task :install_dev_tools do
    sudo "apt-get install build-essential -y", :shell => 'bash'
  end

  desc "Install git."
  task :install_git do
    sudo "apt-get install git-core git-svn -y", :shell => 'bash'
  end

  desc "Install miscelaneous dependencies."
  task :install_dependencies do
    sudo "apt-get install build-essential bison openssl libreadline6 libreadline6-dev libcurl4-openssl-dev git-core zlib1g zlib1g-dev  libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev curl -y", :shell => 'bash'
  end

  desc "Install nginx."
  task :install_nginx do
    sudo "apt-get install nginx -y", :shell => 'bash'
  end

  desc "Install sqlite3."
  task :install_sqlite3 do
    sudo "apt-get install sqlite3 libsqlite3-ruby -y", :shell => 'bash'
  end

  desc "Install postgresql."
  task :install_postgresql do
    sudo "apt-get install postgresql -y", :shell => 'bash'
  end

  desc "Install imagemagick."
  task :install_imagemagick do
    sudo "apt-get install libmagickwand-dev imagemagick -y", :shell => 'bash'
  end

  desc "Change ownership of /var/www/."
  task :set_permissions do
    sudo "mkdir -p /var/www"
    sudo "chown -R dallan:dallan /var/www/", :shell => 'bash'
  end

  desc "Install RVM."
  task :install_rvm do
    run "bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)", :shell => 'bash'
  end

  desc "Install ruby."
  task :install_ruby do
    "/bin/bash --login"
    "rvm install ruby-1.9.3-p327"
    "rvm --default use 1.9.3-p327"
    "rvm gemset create global"
    "rvm gemset use global"
  end

  desc "Install rdoc and bundler."
  task :install_rdoc_and_bundler do
    "gem install rdoc"
    "bundle exec gem install bundler"
  end

  desc "Create postgres user."
  task :create_postgres_user do
    sudo "su postgres"
    "psql"
    "ALTER USER postgres WITH PASSWORD '#{db_password}';"
    "CREATE DATABSE #{app_name}"
    "\q"
    "exit"
  end

end
