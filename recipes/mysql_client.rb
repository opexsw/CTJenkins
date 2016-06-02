# install mysql-client

directory '/var/lib/jenkins/files' do
  action :create
end

remote_file "/var/lib/jenkins/files/backup-magento-testnow.sql" do
  source "https://s3.amazonaws.com/spirentmysql/backup-magento-testnow.sql"
  action :create
end

package 'mysql-client-5.5'
