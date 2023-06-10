
# workdir
mkdir nginx
cd nginx
wget http://nginx.org/download/nginx-1.18.0.tar.gz
tar -zxvf nginx-1.18.0.tar.gz
git clone https://gitee.com/web_design_of_web_frontend/ngx_http_proxy_connect_module.git

cd ..

# and then build the dockerfile
docker build -t nginx:proxy_1.80.0 .

# up container with docker-compose
docker-compose up -d