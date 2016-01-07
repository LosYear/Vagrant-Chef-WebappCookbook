mysql_service 'default' do
  port '3306'
  version '5.5'
  initial_root_password '1111'
  socket '/var/run/mysqld/mysqld.sock'
  action [:create, :start]
end

mysql2_chef_gem 'default' do
  action :install
end

mysql_database 'project' do
  connection(
    :host     => '127.0.0.1',
    :username => 'root',
    :password => '1111'
  )
  action :create
end

execute 'restore-databases' do
  command "mysql -u root -p1111 -D project < /vagrant/dump.sql"
end
