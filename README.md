# Docker-Tips

## DockerSQL || Create a useful ready to use MySQL Docker !

**Install Docker**
Check https://docs.docker.com/install/ to install it

**DO NOT PUT YOUR REAL PASSWORD (Put a password in this way is not safe at all)**
- Initialize MySQL Docker's container :
```
> sudo usermod -aG docker $USER
> docker pull mysql
> docker run -d --name <NAME> -e MYSQL_ROOT_HOST='%' -e MYSQL_ROOT_PASSWORD='<PASSWORD>' -d mysql/mysql-server:latest
```

**To use it:**
```
> docker exec -it <NAME> mysql -uroot -p #to enter directly in MySQL
> docker exec -it <NAME> /bin/bash #To enter in bash mode
```

**Make that easier :**
- Put an alias into your .bashrc or .zshrc (at the end of the file)
```
alias dockersql='docker start <NAME> && docker exec -it <NAME> mysql -uroot -p'
> source ~/.bashrc
```
