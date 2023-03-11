[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)
# DEPRECATED/LOOKING FOR MAINTAINERS -> to be archived soon

[![Build Status - Master](https://travis-ci.org/juju4/ansible-w3af.svg?branch=master)](https://travis-ci.org/juju4/ansible-w3af)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-w3af.svg?branch=devel)](https://travis-ci.org/juju4/ansible-w3af/branches)
# w3af web scanner ansible role

A simple ansible role to setup w3af web scanner
http://w3af.org/

While not officially umaintained, w3af is still missing python3 support.
It is recommended to look for alternatives like nuclei.

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0
 * 2.2
 * 2.5

### Operating systems

Tested on Ubuntu 14.04, 16.04 and 18.04, Kitchen test with trusty and centos7

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.w3af
```

## Variables

Nothing specific for now.

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ gem install kitchen-ansible kitchen-lxd_cli kitchen-sync kitchen-vagrant
$ cd /path/to/roles/juju4.w3af
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.w3af/test/vagrant
$ vagrant up
$ vagrant ssh
```

Role has also a packer config which allows to create image for virtualbox, vmware, eventually digitalocean, lxc and others.
When building it, it's advise to do it outside of roles directory as all the directory is upload to the box during building 
and it's currently not possible to exclude packer directory from it (https://github.com/mitchellh/packer/issues/1811)
```
$ cd /path/to/packer-build
$ cp -Rd /path/to/w3af/packer .
## update packer-*.json with your current absolute ansible role path for the main role
## you can add additional role dependencies inside setup-roles.sh
$ cd packer
$ packer build packer-*.json
$ packer build -only=virtualbox-iso packer-*.json
## if you want to enable extra log
$ PACKER_LOG_PATH="packerlog.txt" PACKER_LOG=1 packer build packer-*.json
## for digitalocean build, you need to export TOKEN in environment.
##  update json config on your setup and region.
$ export DO_TOKEN=xxx
$ packer build -only=digitalocean packer-*.json
```

## Troubleshooting & Known issues

* PyOpenSSL not running on Ubuntu xenial
w3af requires pyOpenSSL==0.13.1 which does not build on recent systems
https://github.com/pyca/pyopenssl/issues/276
latest release (16.1.0) is not affected.

* [Upstream Python3 support pending](https://github.com/andresriancho/w3af/issues/17866)

## License

BSD 2-clause

