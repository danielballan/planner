$ ssh root@198.74.56.210
root@localhost:~# adduser dallan
root@localhost:~# adduser dallan sudo

$ scp ~/.ssh/id_rsa.pub dallan@198.74.56.210: # notice trailing colon
$ ssh 198.74.56.210 -l dallan

root@localhost:~# mkdir .ssh
root@localhost:~# cat id_rsa.pub >> .ssh/authorized_keys
root@localhost:~# rm id_rsa.pub
root@localhost:~# chmod 600 .ssh/authorized_keys
root@localhost:~# chmod 700 .ssh
root@localhost:~# ssh-keygen -t rsa -C "daniel.b.allan@gmail.com"

Add 'capistrano' to Gemfile.
$ bundle install
$ capify .
