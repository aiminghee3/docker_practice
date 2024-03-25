FROM mysql:8

RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# 컨테이너가 시작될 때 MySQL 서버가 자동시작
CMD ["mysqld"]
