# Image Validating Webook 설치 가이드
project repo: https://github.com/tmax-cloud/image-validating-webhook

## 구성 요소 및 버전
* tmaxcloudck/image-validation-webhook ([tmaxcloudck/image-validation-webhook:v5.0.2](https://hub.docker.com/layers/tmaxcloudck/image-validation-webhook/v5.0.2/images/sha256-f474ff8c40568ea7be9c203c1138ed3ca8c16fa372b11c23f50fbd79fc2a4164?context=repo))

## Install (폐쇄망 X)
폐쇄망이 아닌 경우에는 상기한 project repo의 install guide를 참고합니다.

## Install (폐쇄망 구축 가이드)
1. tmaxcloudck/image-validation-webhook 이미지 레지스트리에 추가  
    - [install-registry 이미지 푸시하기 참조](https://github.com/tmax-cloud/install-registry/blob/5.0/podman.md)

2. Deployment 수정
   ```bash
   sed -i "s/image:[ \t]*tmaxcloudck\/image-validation-webhook[^\n]*/image: $REGISTRY\/tmaxcloudck\/image-validation-webhook:$VERSION/" manifests/deployment.yaml
   ```

3. install.sh를 실행합니다.
    ```bash
    bash install.sh
    ```

## Uninstall
1. uninstall.sh를 실행합니다.
   ```bash
   bash uninstall.sh
   ```
