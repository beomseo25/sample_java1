#!/bin/bash

echo "[CD LOG] --------------------------------------------------"
echo "[CD LOG] 2단계: Docker Hub로부터 최신 이미지를 다운로드하고 가동합니다."
echo "[CD LOG] --------------------------------------------------"

DOCKER_HUB_USERNAME="내_도커허브_아이디"
IMAGE_NAME="sample-java1"

echo "[CD LOG] ➔ Docker Hub 원격 창고에서 최신 'latest' 이미지 Pull 진행 중..."
docker pull $DOCKER_HUB_USERNAME/$IMAGE_NAME:latest

echo "[CD LOG] ➔ 최신 이미지로 스프링부트 컨테이너 기동 프로세스를 시작합니다."

docker run -d \
  --name sample-java1 \
  -p 8080:8080 \
  -v /home/ubuntu/app/logs:/logs \
  -e LOGGING_FILE_PATH=/logs \
  $DOCKER_HUB_USERNAME/$IMAGE_NAME:latest

echo "[CD LOG] ➔ 스프링부트 컨테이너 가동 명령이 완료되었습니다!"
echo "[CD LOG] ➔ 잠시 후 웹 파일 탐색기(Filebrowser)에서 logs/ 폴더를 확인하세요."
