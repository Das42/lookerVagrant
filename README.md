## Intro

This is an attempt to create a fully contained looker instance and test database than can be easily spun up/torn down with simple vagrant up/vagrant halt commands. This can be used for providing a more consistant tinkering environment for teams vs. everyone running a localhost version of looker on a variety of operating systems and configurations.

## Prerequisites

1. Vagrant
2. this uses the ubuntu/trusty64 vagrant box, so you probably want that too
3. A file named looker.jar needs to be present in the same directory. If your organization owns looker then you should have access to this.
4. A license key. You may want to reach out to your looker reps to make sure this key can be used multiple times for individual local testing.
5. While this has been tested on a system with 8gb of RAM, I'd strongly encourage using a system of at least 16gb.

## Instructions

1. Make sure you have a looker.jar file in the same directory
2. vagrant up. Go get a snack.
3. connect to 192.168.56.110:9999
4. Enter your license key and info.
5. Set up a mysql database connection to 192.168.56.101. Port is 3306. User and Password are both 'looker'. the scratch directory for PDTs is 'looker-scratch'. The database name is 'classicmodels'
6. When you're done tinkering, vagrant halt. The next time you vagrant up should take significantly less time. You can do vagrant destroy as well, but then the next time you vagrant up the full provisioning script will need to run.

Enjoy!
