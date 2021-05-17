# Image Validating Webook 설치 가이드
project repo: https://github.com/tmax-cloud/image-validating-webhook

## Install (폐쇄망 X)
폐쇄망이 아닌 경우에는 상기한 project repo의 install guide를 참고합니다.

## Install (폐쇄망 구축 가이드)
1. 외부 네트워크 통신이 가능한 환경에서 필요한 이미지를 다운받습니다.
    ```bash
    # Webhook 버전
    VERSION=v5.0.1

    # 이미지 pull
    docker pull tmaxcloudck/image-validation-webhook:$VERSION

    # 이미지 save
    docker save tmaxcloudck/image-validation-webhook:$VERSION > image-validation-webhook.tar
    ```

2. 폐쇄망으로 이미지 압축파일(.tar)을 옮깁니다.
   
3. 폐쇄망에서 사용하는 registry에 이미지를 push 합니다.
    ```bash
    # Webhook 버전
    VERSION=v5.0.1
   
    # 이미지 레지스트리 주소
    REGISTRY=[IP:PORT]

    # 이미지 Load
    docker load < image-validation-webhook.tar

    # 이미지 Tag
    docker tag tmaxcloudck/image-validation-webhook:$VERSION $REGISTRY/tmaxcloudck/image-validation-webhook:$VERSION

    # 이미지 Push
    docker push $REGISTRY/tmaxcloudck/image-validation-webhook:$VERSION
    ```

4. Deployment 수정
   ```bash
   sed -i "s/image:[ \t]*tmaxcloudck\/image-validation-webhook[^\n]*/image: $REGISTRY\/tmaxcloudck\/image-validation-webhook:$VERSION/" manifests/deployment.yaml
   ```

5. install.sh를 실행합니다.
    ```bash
    bash install.sh
    ```

## Uninstall
1. uninstall.sh를 실행합니다.
   ```bash
   bash uninstall.sh
   ```
