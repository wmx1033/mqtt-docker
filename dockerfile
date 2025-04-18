FROM ubuntu:22.04

# 安装Mosquitto
RUN apt-get update && \
    apt-get install -y mosquitto

# 复制自定义配置
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf
COPY passwd_file /etc/mosquitto/passwd_file

# 确保权限正确
RUN chmod 600 /etc/mosquitto/passwd_file

# 开放端口
EXPOSE 1883
EXPOSE 9001

# 启动mosquitto服务
CMD ["mosquitto", "-c", "/etc/mosquitto/mosquitto.conf", "-v"]