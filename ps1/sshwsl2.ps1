$wsl2ip = wsl -e hostname -I
    #wsl -e sudo service ssh start
    ssh scudzy@$wsl2ip -p 2222