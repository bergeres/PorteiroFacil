plugins {
    id("com.android.application") version "8.7.3" apply false
    id("org.jetbrains.kotlin.android") version "2.0.21" apply false
    id("org.jetbrains.kotlin.plugin.compose") version "2.0.21" apply false
    id("org.jetbrains.kotlin.kapt") version "2.0.21" apply false
}

// Atalhos simples para gerar o APK sem depender de abreviações de tarefas.
// Terminal Windows: gradle apkDebug   (ou gradlew.bat apkDebug, quando o Wrapper existir)
// Terminal Linux/macOS: gradle apkDebug (ou ./gradlew apkDebug, quando o Wrapper existir)
tasks.register("apkDebug") {
    group = "build"
    description = "Gera o APK de debug do Porteiro Fácil."
    dependsOn(":app:assembleDebug")
}

tasks.register("apkRelease") {
    group = "build"
    description = "Gera o APK de release (assinatura deve ser configurada para distribuição)."
    dependsOn(":app:assembleRelease")
}
