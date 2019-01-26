### install dependencies for generating cursor pack
```
sudo apt-get install libcanberra-gtk-module
```

### make a file executable
- add ```#!/bin/bash -e``` this to the top
```bash
sudo chmod +x <filename.sh>
```

### list partitions
```bash
df
```

### mount a partition
```bash
sudo mount -t hfsplus -o rw,remount -force <partition-name> /media/<folder-name>
```

### unmount a partition
```bash
sudo umount <partition_name>
```


