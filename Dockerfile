FROM budtmo/docker-android:emulator_10.0

USER root

ARG APPIUM_VERSION=2.19.0
ARG UIAUTOMATOR2_VERSION=4.2.0

RUN npm install --global "appium@${APPIUM_VERSION}" --unsafe-perm=true --allow-root \
    && appium driver install "uiautomator2@${UIAUTOMATOR2_VERSION}" \
    && npm cache clean --force

USER androidusr
