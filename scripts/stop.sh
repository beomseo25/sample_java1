#!/bin/bash

echo "[CD LOG] --------------------------------------------------"
echo "[CD LOG] 1단계: 기존 구버전 도커 컨테이너 중지 및 삭제를 시작합니다."
echo "[CD LOG] --------------------------------------------------"

if [ "$(docker ps -a -q -f name=sample-java1)" ]; then
    echo "[CD LOG] ➔ 실행 중인 구버전 컨테이너를 발견했습니다. 중지 및 삭제를 진행합니다."
    docker stop sample-java1
    docker rm sample-java1
    echo "[CD LOG] ➔ 구버전 컨테이너가 안전하게 제거되었습니다."
else
    echo "[CD LOG] ➔ 현재 실행 중인 구버전 컨테이너가 없으므로 정지 단계를 패스합니다."
fi

docker image prune -f
