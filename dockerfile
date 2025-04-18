FROM ubuntu:22.04

# 安装Mosquitto
RUN apt-get update && \
    apt-get install -y mosquitto

# 创建必要的目录并设置权限
RUN mkdir -p /run/mosquitto && \
    mkdir -p /var/log/mosquitto && \
    mkdir -p /var/lib/mosquitto && \
    chown -R mosquitto:mosquitto /run/mosquitto /var/log/mosquitto /var/lib/mosquitto

# 创建密码文件并设置密码
RUN touch /etc/mosquitto/passwd_file && \
    mosquitto_passwd -b /etc/mosquitto/passwd_file node1 123456 && \
    mosquitto_passwd -b /etc/mosquitto/passwd_file node2 123456 && \
    mosquitto_passwd -b /etc/mosquitto/passwd_file node3 123456 && \
    mosquitto_passwd -b /etc/mosquitto/passwd_file server1 123456 && \
    mosquitto_passwd -b /etc/mosquitto/passwd_file server2 123456 && \
    mosquitto_passwd -b /etc/mosquitto/passwd_file server3 123456 && \
    chmod 600 /etc/mosquitto/passwd_file && \
    chown mosquitto:mosquitto /etc/mosquitto/passwd_file

# 复制自定义配置
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf
RUN chown mosquitto:mosquitto /etc/mosquitto/mosquitto.conf

# 开放端口
EXPOSE 1883
EXPOSE 9001

# 启动mosquitto服务
CMD ["mosquitto", "-c", "/etc/mosquitto/mosquitto.conf", "-v"]