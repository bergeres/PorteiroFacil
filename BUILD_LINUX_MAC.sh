#!/usr/bin/env sh
set -e
cd "$(dirname "$0")"

echo "Porteiro Fácil - Gerar APK DEBUG"

if [ -f ./gradlew ] && [ -f ./gradle/wrapper/gradle-wrapper.jar ]; then
  chmod +x ./gradlew
  ./gradlew :app:assembleDebug
elif command -v gradle >/dev/null 2>&1; then
  gradle :app:assembleDebug
else
  echo "ERRO: Gradle Wrapper não está completo e Gradle não está instalado no PATH."
  echo "Abra o projeto no Android Studio e use o menu: Build > Generate Bundle(s) / APK(s) > Generate APK(s)"
  echo "IMPORTANTE: os sinais > acima são apenas separadores do menu; não digite > no Terminal."
  exit 1
fi

echo "APK: app/build/outputs/apk/debug/app-debug.apk"
