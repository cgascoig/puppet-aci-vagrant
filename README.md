# puppet-aci-vagrant
Vagrantfile and supporting files to easily setup a puppet master with the puppet-aci module ready to use

# Usage
## Clone the repository

````
git clone https://github.com/cgascoig/puppet-aci-vagrant
cd puppet-aci-vagrant
```

## Start the VM:

`vagrant up`

This will clone the puppet-aci repository, start an Ubuntu 15.04 VM, install puppet (4.3) and puppetserver, install the puppet-aci module
along with its requirements

## Get started:

 - Create the device config file (`private/device.conf`), using the sample file (`private/device.conf.sample`)
 - Update the sample manifest (`environment_production/manifests/site.pp`) to suit your needs, or just use the sample that creates a basic 3-tier application profile in the "puppet-test" tenant. The 'environment_production' folder on the host is synced to the puppet production environment of the master automatically, so you can edit the files on your host.
 - SSH into the vm: `vagrant ssh`
 - Finally run the puppet device framework to configure ACI as per the manifest: `puppet device --debug --trace --server localhost --deviceconfig ~/private/device.conf`
 
# Requirements

Tested with:
 - Vagrant 1.7.4
 - VirtualBox 5.0.10
