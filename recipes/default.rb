#
# Cookbook Name:: CTJenkins
# Recipe:: default
#
# Copyright 2016,  Opex Software
#
# All rights reserved - Do Not Redistribute
#
include_recipe "CTJenkins::install-jenkins"
include_recipe "CTJenkins::configure-jenkins"
