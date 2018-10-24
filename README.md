## 眼中

项目中使用：
- Ruby 2.5.3
- Rails 5.2.1
- Capistrano
- Docker & Docker Compose
- PostgreSQL
- Nginx

服务器支持阿里云 `Ubuntu 16.04` 64位，本地支持  `MAC`，其他环境未经过测试。

### 准备工作
#### 登陆服务器
```bash
# ssh 用户@IP
# 比如我的服务器用户是 root，IP 是 47.92.214.225
ssh root@47.92.214.225
```
先遇到 `Are you sure you want to continue connecting (yes/no)?` 
输入 `yes` 进入下一步。

然后服务器会要求你输入密码 `root@47.92.214.225's password`
输入正确的密码后，我们就登陆到服务器了。

#### 使用 `root` 用户并不好，我们创建一个新用户 `deploy`
```bash
adduser deploy --ingroup sudo
# 输入新密码

# 切换到 deploy 用户
sudo su deploy

# 进入当前用户根目录
cd 
```

#### 让我们回到本地，以 MAC 为例
```bash
# Mac 本地
ssh-keygen -t rsa
# 如果不需要加密，就直接全部回车。需要加密，就自己填写密码

cat ~/.ssh/id_rsa.pub
# 会出现一段文字，复制下来
```

#### 然后再回到服务器
```bash
# 服务器上
ssh-keygen -t rsa
# 依然全部直接回车

vi /home/deploy/.ssh/authorized_keys
# 将刚才 Mac 本地命令行中，复制的那一段文字，粘贴进去，然后按 :wq 保存离开

# 设置权限并重启
chmod 644 /home/deploy/.ssh/authorized_keys
sudo service ssh restart
```
现在你再用 `SSH` 连服务器，直接 `ssh deploy@ip`，不再需要输入密码了。

参考文档
- [Capistrano + Rails 5.2 自动化部署](https://ruby-china.org/topics/36899)

### 获取项目代码
```bash
git clone https://github.com/tuliang/in-the-eyes.git
cd in-the-eyes

bundle install
```

### 安装
```bash
# 将项目代码发布到服务器
cap production deploy
# 安装
cap production deploy:install
```
#### 说明
1. 将项目代码发布到服务器
2. 安装 `docker & docker-compose`
3. 执行 `docker-compose build`
4. 运行所有服务 `docker-compose up -d`
5. 初始化数据库
>- rails db:create  
>- rails db:migrate  
>- rails db:seed

### 更新
```bash
# 更新
cap production deploy:update
```
#### 说明
1. 更新项目代码
2. 执行 `docker build` 构建最新的 Rails 服务 image 
3. 重启 Rails 服务
>- docker-compose stop app 
>- docker-compose up -d app  
4. 更新数据库
- 支持 `rails db:migrate`

### 重启
```bash
cap production deploy:restart
```
#### 说明
1. 重启所有服务
>- docker-compose stop 
>- docker-compose up -d  

## TODO
- 用户设置 IP，自动化完成准备工作
- 拆分自动化部署和项目代码
- 回滚 rollback