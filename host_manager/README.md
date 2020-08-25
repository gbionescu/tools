# Host Manager

These tools offer a quick method for storing aliases for your favorite hosts.

### Usage
```
# Add a host to the cache
htool add host1 127.0.0.1

# SSH to the 'host1' machine
gssh htool
```

If you use a `.pem` file, you can specify it when adding the alias:
```
htool add host2 8.8.8.8 --pem ~/key/my.pem

# SSH to the 'host2' machine
gssh host2
```

The tool set also provides shortcuts for rsync upload/download:
```
# Upload a file
grsyncu host1 ./file /home/user/file_dest

# Download a file
grsyncd host2 /home/user/interesting_file ./local_file
```

To list or remove an alias you can:
```
htool list
```

Will output:
```
    host1 - 127.0.0.1
    host2 - 8.8.8.8 ~/key/my.pem
```

Let's remove a host:
```
htool rem host1
```

List it again
```
htool list
```

Will output:
```
    host2 - 8.8.8.8 ~/key/my.pem
```

