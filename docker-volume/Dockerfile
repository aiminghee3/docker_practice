FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

# VOLUME ["/app/node_modules"]

CMD ["npm", "start"]

# VOLUME ["/app/feedback"]
# VOLUME은 컨테이너에서 생성한 데이터를 외부 경로에 저장하여 다른 컨테이너에서도 접근 가능하게 하는 명령어
# 현재 /app폴더가 WORKDIR이라 루트 경로가 /app인듯
# 따라서 /app/feedback은 컨테이너의 외부 폴더에 매핑되어질 컨테이너 내부 위치이며, 데이터가 유지할 위치
# 근데 위 코드는 익명볼륨이기 때문에 컨테이너가 삭제되면 볼륨도 같이 삭제됨
# 따라서 해결책은 컨테이너를 실행할 때 볼륨을 만들어야 한다고 함
# 그 명령어가 docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback feedback-node:volumes
# 익명 볼륨과 달리 위 코드처럼 명명된 볼륨은 컨테이너가 종료될 때 도커에의해 삭제되지 않음

# 바인드 마운트 코드
# docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v "/Users/jojunhui/Desktop/project/docker/docker-volume:/app" feedback-node:volumes
# 절대경로를 사용해야함 "/Users/jojunhui/Desktop/project/docker/docker-volume:/app"    :전까지 경로가 /app에 명명된 볼륨으로 마운트 됨.

# NOTE : 콜론 앞에 로컬 머신 경로가 붙으면 바인드 마운트가 되고, 콜론 앞에 경로가 아닌 것이 붙으면 볼륨 이름으로 취급됨

# 근데 저기에 익명 볼륨으로 node_modules안쓰면 오류생김 이유는 좀 어려워서 나중에 공부하려면 다른 볼륨 결합 & 병합하기 강의 들으면됨
# docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v "/Users/jojunhui/Desktop/project/docker/docker-volume:/app" -v /app/node_modules feedback-node:volumes