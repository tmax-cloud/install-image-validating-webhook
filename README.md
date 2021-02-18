# Image Validating Webook 설치 가이드
project repo: https://github.com/tmax-cloud/image-validating-webhook

## Install (폐쇄망 X)
폐쇄망이 아닌 경우에는 상기한 project repo의 install guide를 참고합니다.

## Install (폐쇄망 구축 가이드)
1. 외부 네트워크 통신이 가능한 환경에서 필요한 이미지를 다운받습니다.
    ```bash
    # 이미지 pull
    docker pull ghkimkor/image-validation-webhook

    # 이미지 save
    docker save ghkimkor/image-validation-webhook > image-validation-webhook.tar
    ```

2. 폐쇄망으로 이미지 압축파일(.tar)을 옮깁니다.
   
3. 폐쇄망에서 사용하는 registry에 이미지를 push 합니다.
    ```bash
    # 이미지 레지스트리 주소
    REGISTRY=[IP:PORT]

    # 이미지 Load
    docker load < image-validation-webhook.tar

    # 이미지 Tag
    docker tag ghkimkor/image-validation-webhook ${REGISTRY}/ghkimkor/image-validation-webhook

    # 이미지 Push
    docker push ${REGISTRY}/ghkimkor/image-validation-webhook
    ```

4. deploy/deployment의 spec에서 webhook container의 image를 폐쇄망 레지스트리의 이미지로 설정합니다.
    ```yaml
    apiVersion: apps/v1
    kind: Deployment
    metadata:
        name: image-validation-admission
        namespace: registry-system
        labels:
            name: image-validation-admission
    spec:
        replicas: 1
        selector:
        matchLabels:
            app: image-validation-admission
        template:
            metadata:
                labels:
                    app: image-validation-admission
            spec:
                containers:
                    - name: webhook
                    image: ${REGISTRY}/ghkimkor/image-validation-webhook
                    imagePullPolicy: Always
                    volumeMounts:
                        - name: webhook-certs
                        mountPath: /etc/webhook/certs
                        readOnly: true
                        - name: whitelist
                        mountPath: /etc/webhook/config
                        readOnly: true
                volumes:
                    - name: webhook-certs
                    secret:
                        secretName: image-validation-admission-certs
                    - name: whitelist
                    configMap:
                        name: image-validation-webhook-whitelist                      
                serviceAccountName: image-validation-webhook
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