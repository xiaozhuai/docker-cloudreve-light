# cloudreve

轻量版，包含 aria2 + cloudreve

全功能版见 [xiaozhuai/cloudreve](https://hub.docker.com/repository/docker/xiaozhuai/cloudreve)

## 使用方法

``` bash
# 创建一个目录，用于存放数据
mkdir ${/path/to/cloudreve}
# 启动容器
docker run -d --restart=always --name="cloudreve" -p 5000:80 -v ${/path/to/cloudreve}:/cloudreve xiaozhuai/cloudreve-light:latest
# 从日志查看初始账号密码 (只有首次启动会显示)
cat ${/path/to/cloudreve}/log/cloudreve_stdout.log.0
```

## aria2配置

使用管理员账号登录
点击头像--管理面板--参数设置--离线下载

* RPC 服务器地址: ws://127.0.0.1:6800
* RPC Secret: cloudreve
* 临时下载目录: /cloudreve/downloads


## 目录或文件说明

* uploads 网盘文件存储目录
* downloads aria2临时下载目录
* cert ssl证书目录，在此目录下放置 `cloudreve.pem` 和 `cloudreve.key` 来开启https
* cloudreve.db sqlite数据库文件
* log 日志目录

