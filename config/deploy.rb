# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'swagger-ui'
set :repo_http_url, 'https://github.com/beachyapp/swagger-ui'
set :repo_url, 'git@github.com:beachyapp/swagger-ui.git'
set :default_env, {
  path: ["/usr/local/rbenv/shims",
    "#{shared_path}/node_modules/bower/bin",
    "#{shared_path}/node_modules/gulp/bin",
    "$PATH"].join(":")
}

set :slack_channel, '#build-and-deploy'

set :branch, $1 if `git branch` =~ /\* (\S+)\s/m
set :rev, `git rev-parse --short HEAD`.chomp.strip
set :deploy_to, '/home/deploy/swagger-ui'
set :scm, :git
set :format, :pretty
set :log_level, :debug
set :keep_releases, 5
set :linked_dirs, fetch(:linked_dirs, []).push('node_modules')
set :local_app_path, Pathname.new(File.join(__dir__, '..'))
