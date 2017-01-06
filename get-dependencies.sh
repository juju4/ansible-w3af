#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

#[ ! -d $rolesdir/juju4.redhat-epel ] && git clone https://github.com/juju4/ansible-redhat-epel $rolesdir/juju4.redhat-epel
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.w3af ] && ln -s ansible-w3af $rolesdir/juju4.w3af
[ ! -e $rolesdir/juju4.w3af ] && cp -R $rolesdir/ansible-w3af $rolesdir/juju4.w3af

## don't stop build on this script return code
true

