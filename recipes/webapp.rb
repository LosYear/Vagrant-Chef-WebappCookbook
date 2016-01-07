web_app "webapp" do
      server_name node['webapp']['hostname']
      docroot node['webapp']['docroot']
      allow_override "All"
      directory_options "Indexes FollowSymLinks"
      cookbook 'apache2'
 end
