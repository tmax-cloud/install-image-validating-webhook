# Image Validating Webook 설치 가이드
project repo: https://github.com/tmax-cloud/image-validating-webhook

## 구성 요소 및 버전
* tmaxcloudck/image-validation-webhook ([tmaxcloudck/image-validation-webhook:v5.0.1](https://hub.docker.com/layers/tmaxcloudck/image-validation-webhook/v5.0.1/images/sha256-946c3c6b211e3cd857126b912bb68504333a3059e9c554108a63f8994aca4ea0?context=explore))

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
