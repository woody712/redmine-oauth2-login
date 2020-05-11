require 'redmine'
require_dependency 'redmine_oauth2_login/hooks'
require_dependency 'redmine_oauth2_login/account_controller_patch'

Redmine::Plugin.register :redmine_oauth2_login do
  name 'OAuth2 Login Plugin'
  author 'liuyh970615@gmail.com'
  description 'This is a plugin for Redmine authentication with OAuth (Such As GitHub and JAccount)'
  url 'https://github.com/tc-imba/redmine-oauth2-login'
  author_url 'https://github.com/tc-imba'
  version '1.0.0'
  requires_redmine :version_or_higher => '3.0.0'

  settings :default => {
    :client_id => "",
    :client_secret => "",
    :provider => "github",
    :access_token_uri => "https://github.com/login/oauth/access_token",
    :authorization_uri => "https://github.com/login/oauth/authorize",
    :user_info_uri => "https://api.github.com/user",
    :user_logout_uri => "https://github.com/logout",
    :enabled => false,
    :user_auto_create => false,
    :replace_redmine_login => false
  }, :partial => 'settings/oauth2_settings'

  Rails.configuration.to_prepare do
    AccountController.send(:include, AccountControllerPatch)
  end
end
