#### install rvm
```
sudo apt install -y curl gnupg build-essential
sudo gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | sudo bash -s stable
sudo usermod -a -G rvm `whoami`
```

#### list available ruby
```
rvm list known
```

#### list installed ruby
```
rvm list
```

#### install ruby version
```
rvm install <ruby-version>
```

#### use ruby version
```
rvm use <ruby-version>
```

#### remove rvm
```
sudo nano ~/.bashrc

# remove line
...
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

sudo rm -rf ~/.rvm
```


source /etc/profile.d/rvm.sh