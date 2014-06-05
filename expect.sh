#!/usr/bin/expect
#Start SSH session
spawn ssh admin@your_controller
sleep 2
#password prompt and send password
expect {
"word:" {send "password\r"}
}
sleep 1
#Login to enabled mode and issue the command to backup flash
expect {
"*>" {send "en\r"}
}
sleep 1
expect {
"*word:" {send "password\r"}
}
sleep 1
#Backup flash
expect {
"#" {send "backup flash\r"}
}
sleep 120
#Send flash.tar to tftp
expect {
"#" {send "copy flash: flashbackup.tar.gz tftp: tftp_ip file-name.tar.gz\r"}
}
sleep 15
#Delete backup from controller
expect {
"#" {send "delete filename flashbackup.tar.gz\r"}
}
sleep 1
#Exit cleanly
expect {
"*#" {send "exit\r"}
}
sleep 1
expect {
"*>" {send "exit\r"}
}
