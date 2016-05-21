#
# Cookbook Name:: CTJenkins
# Recipe:: configure-jenkins
#
# Copyright 2016,  Opex Software
#
# All rights reserved - Do Not Redistribute
#

# copy jobs folder
execute "copy jobs folder" do
  command "cp -R /tmp/jobs.tar.gz /var/lib/jenkins/"
  action :run
end

# untar jobs folder
execute "untar jobs folder" do
  command "cd /var/lib/jenkins; tar -zxvf /var/lib/jenkins/jobs.tar.gz"
  action :run
end

# copy plugins folder
execute "copy plugins folder" do
  command "cp -R /tmp/plugins.tar.gz /var/lib/jenkins/"
  action :run
end

# untar plugins folder
execute "untar plugins folder" do
  command "cd /var/lib/jenkins; tar -zxvf /var/lib/jenkins/plugins.tar.gz"
  action :run
end

# copy config.xml
execute "copy config.xml folder" do
  command "cp -R /tmp/config.xml /var/lib/jenkins/"
  action :run
end

# Configure the TestNow plugin in jenkins
template "/var/lib/jenkins/testnow.testnowplugin.TestNowBuilder.xml" do
        source "testnow.testnowplugin.TestNowBuilder.xml.erb"
        variables({
		:isUrlTest  => "#{node['CTJenkins']['isUrlTest']}",
                :testNowBaseUrl => "#{node['CTJenkins']['testNowBaseUrl']}",
                :testNowUIUrl => "#{node['CTJenkins']['testNowUIUrl']}",
                :testNowUsername => "#{node['CTJenkins']['testNowUsername']}",
                :testNowPassword => "#{node['CTJenkins']['testNowPassword']}"
        })
end

# Restart jenkins for configuration to take effect
service "jenkins" do
  action :restart
end
