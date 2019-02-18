#### install dependencies for generating cursor pack
```
sudo apt-get install libcanberra-gtk-module
```

#### make a file executable
- add ```#!/bin/bash -e``` this to the top
```bash
sudo chmod +x <filename.sh>
```

#### list partitions
```bash
df
```

#### mount a partition
```bash
sudo mount -t hfsplus -o rw,remount -force <partition-name> /media/<folder-name>
```

#### unmount a partition
```bash
sudo umount <partition_name>
```

#### show logs
```
PS4='+$BASH_SOURCE> ' BASH_XTRACEFD=7 bash -xl 7>&2
```

#### add to group
```
usermod -a -G <groupname> <username>
```

#### list process with search
```
ps -e|grep <appname>
```

#### kill process using port
```
kill -9 <port>
```
#### check apps that listen on a port
```
sudo netstat -tulpn | grep 443
```