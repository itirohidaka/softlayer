#!/usr/bin/env ruby
#==============================================================================
# File: CreateVSRails.rb
# Title: Create a new Virtual Server with Rails frameword
# Description: Ruby Script to create a new virtual server with Rails
# Author: Gerson Itiro Hidaka
# Date: 11/06/2015 (dd/mm/yyy)
#==============================================================================
# Disclaimer
# Be aware that all scripts are run at your own risk and while every script has
# been written with the intention of minimising the potential for unintended
# consequences, the owners, hosting providers and contributers cannot be held
# responsible for any misuse or script problems.
#==============================================================================
require 'rubygems'
require 'softlayer_api'
require 'json'
#==============================================================================
# Read the JSON file and extract the username and apikey
#==============================================================================
file = File.read('usernamekey.json')
data_hash = JSON.parse(file)
#==============================================================================
# Use the username and apikey on SoftLayer API (Authentication)
#==============================================================================
$SL_API_USERNAME = data_hash['username']
$SL_API_KEY = data_hash['apikey']
virtual_guest_service = SoftLayer::Service.new("SoftLayer_Virtual_Guest")
#==============================================================================
# Main code: Create a virtual server
#==============================================================================
begin
  templateObject = {
    'complexType' => "SoftLayer_Virtual_Guest",
    'hostname' => 'rails',
    'domain' => 'itiro.com',
    'startCpus' => 2,
    'maxMemory' => 2048,
    'hourlyBillingFlag' => true,
    'operatingSystemReferenceCode' => 'UBUNTU_LATEST',
    'localDiskFlag' => false,
    'blockDevices' => [
        {
            'device' => "0",
            'diskImage' => {
                'capacity'=> 100
            }
        }
    ],
    'postInstallScriptUri' => 'https://raw.githubusercontent.com/itirohidaka/softlayer/master/rails.sh',
    'datacenter' => {
        'name' => 'mon01' },
    'networkComponents' => [
        {
            'maxSpeed' => 100
        }
    ],
  }

  result = virtual_guest_service.createObject(templateObject);
  puts "****************************************"
  puts JSON.pretty_generate(result)
  puts "****************************************"
  guest_id = result['id']
  result = virtual_guest_service.object_with_id(guest_id).setTags("itiro")
rescue => e
  $stdout.print(e.inspect)
end
