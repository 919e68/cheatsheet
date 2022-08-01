# Linux Commands

## Users

### create user

```bash
useradd -m <user>
```

### add user to a group

```bash
usermod -a -G <group> <user>
```

### check groups

```bash
groups
cat /etc/group
```

### create group

```bash
groupadd <group>
```

## Files

### own a file

```bash
chown $USER <filename>
```

### own a folder

```bash
chown -R $USER <folder>
```

#### make a file executable

- add `#!/bin/bash -e` this to the top

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

```bash
PS4='+$BASH_SOURCE> ' BASH_XTRACEFD=7 bash -xl 7>&2
```

#### add to group

```bash
usermod -a -G <groupname> <username>
```

#### list process with search

```bash
ps -e | grep <appname>
```

#### kill process using port

```bash
kill -9 <port>
```

#### check apps that listen on a port

```bash
sudo netstat -tulpn | grep 443
```

#### clean system

```bash
sudo apt-get clean
sudo apt-get autoremove --purge
sudo apt-get remove <package-name> <package-name>
sudo apt-get autoremove
```

#### create bootable drive

```bash
sudo dd bs=4M if=path-to-the-ISO of=/dev/sdX status=progress && sync
```

#### Packages | Apps

```bash
# list apps
apt list

# list apps with search
apt list | grep nginx
```

#### run script from url

```bash
curl -s -L <url> | bash
curl <url> | bash -s arg1 arg2
wget -O - <url>  | bash
```

#### replace a line

```bash
sed -i '/TEXT_TO_BE_REPLACED/c\This line is removed by the admin.' /tmp/foo
```

#### replace subtext

```bash
sed -e '/^HOOKS=(/ s/three five/three four five/;'
```

#### comment uncomment

```bash
# comment
sed -i '/<pattern>/s/^/#/g' file

# uncomment
sed -i '/<pattern>/s/^#//g' file
```
