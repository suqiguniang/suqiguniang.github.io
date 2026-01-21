---
title: Chroot_Debian12
abbrlink: c8c444b7
tags:
---

#分享一个好东西，[Chroot_Debian12](https://share.fnnas.net/s/d1936c52b2ed441396)
一个手机magisk模块，基于Chroot的debian12系统，root密码root，magisk刷入即可使用
```shell
apt update && apt install -y git curl wget nginx 

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
nvm install 24
nvm use 24

npm config set registry https://registry.npmmirror.com
npm install -g hexo-cli

```
###/etc/nginx/nginx.conf
``` shell
# 以 root 用户运行
user root root;
worker_processes auto;
pid /run/nginx.pid;
error_log /var/log/nginx/error.log;

events {
    worker_connections 1024;
    use epoll;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;
    client_max_body_size 100m;
    
    # 日志
    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;
    
    # Gzip
    gzip on;
    gzip_vary on;
    gzip_min_length 1024;
    gzip_types text/plain text/css text/xml text/javascript 
               application/javascript application/xml+rss application/json;
    
    # 虚拟主机
    server {
        listen 80 default_server;
        listen [::]:80 default_server;
        server_name _;
        
        # 【关键】root 用户访问所有目录
        root /workspace/blog/public;
        index index.html index.htm;
        
        # 自动索引（可选）
        autoindex off;
        
        # 安全头部（虽然 root 运行，但仍建议添加）
        add_header X-Frame-Options "SAMEORIGIN" always;
        add_header X-Content-Type-Options "nosniff" always;
        add_header X-XSS-Protection "1; mode=block" always;
        
        # 主位置
        location / {
            try_files $uri $uri/ =404;
            
            # root 用户不需要权限检查
            allow all;
        }
        
        # 静态文件缓存
        location ~* \.(jpg|jpeg|png|gif|ico|css|js|svg|woff|woff2|ttf|eot|webp)$ {
            expires 1y;
            add_header Cache-Control "public, immutable";
            access_log off;
        }
        
        # 错误页面
        error_page 404 /404.html;
        error_page 500 502 503 504 /50x.html;
        
        location = /50x.html {
            root /usr/share/nginx/html;
        }
        
        # 禁止访问隐藏文件
        location ~ /\. {
            deny all;
            access_log off;
            log_not_found off;
        }
        
        # 允许访问所有目录（root 特权）
        location ~ ^/([^/]+/)*[^/]*$ {
            # root 用户可以访问任何目录
        }
    }
    
    # 防止信息泄露
    server_tokens off;
}
```