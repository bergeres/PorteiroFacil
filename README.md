# IMPORTANTE — erro `Task ' > ' not found`

Se esse erro aparecer, **não é necessário alterar o código do app**. Feche o Android Studio e execute `LIMPAR_CONFIGURACAO_ANDROID_STUDIO.bat`, depois abra esta pasta como um projeto novo. Em uma configuração Gradle, o campo **Tasks** deve conter somente `:app:assembleDebug` (ou `apkDebug`) e nunca o caractere `>`.

# Porteiro Fácil — Android

Aplicativo Android para consulta rápida de alunos na portaria escolar, com foco em fotografia, nome, série, turma e responsáveis.

## Correção do erro `Task '>' not found`

O caractere `>` NÃO é uma tarefa Gradle. Ele aparece em instruções como separador de menus do Android Studio.

Exemplo de MENU do Android Studio:

`Build > Generate Bundle(s) / APK(s) > Generate APK(s)`

Não copie essa linha para o Terminal.

### Comando correto para gerar o APK

No Windows, se o projeto possuir Gradle Wrapper completo:

`gradlew.bat :app:assembleDebug`

No Linux/macOS:

`./gradlew :app:assembleDebug`

Se você estiver usando um Gradle instalado no computador:

`gradle :app:assembleDebug`

Também foi adicionado um atalho de tarefa:

`gradle apkDebug`

O APK de debug fica em:

`app/build/outputs/apk/debug/app-debug.apk`

## Importante sobre o Gradle Wrapper

A entrega anterior possuía `gradle/wrapper/gradle-wrapper.properties`, mas não continha todos os arquivos gerados do Wrapper (`gradlew`, `gradlew.bat` e `gradle-wrapper.jar`). A documentação oficial do Gradle informa que esses quatro itens fazem parte do Wrapper.

Se o Android Studio já abriu e sincronizou o projeto, você pode gerar o APK diretamente pelo menu do Android Studio sem digitar o símbolo `>` no Terminal.

Se quiser usar o Terminal e não houver `gradlew.bat`, use um Gradle instalado no PATH ou gere o Wrapper com uma instalação do Gradle:

`gradle wrapper --gradle-version 8.9`

Depois disso, use:

`gradlew.bat :app:assembleDebug`

## O que está implementado

- Tela principal em grade de fotos dos alunos.
- Pesquisa local por nome ou matrícula.
- Filtros locais por série e turma.
- Ficha do aluno com foto ampliada, matrícula, série e turma.
- Lista de responsáveis vinculados ao aluno.
- Banco local Room para evitar consulta à API em cada busca.
- Cache persistente de fotografias.
- Sincronização automática no primeiro acesso de cada dia.
- Botão de atualização manual.
- Preservação do último cache em falha de internet/API.
- Token armazenado com Android Keystore.
- Backup Android desabilitado.
- Bloqueio de captura de tela.
- Comunicação HTTPS.

## API ActiveSoft / SigaWeb

URL de documentação informada:

`https://siga02.activesoft.com.br/docs/`

A tela de configuração permite informar URL base, endpoints e token. O token real não fica gravado em texto puro no projeto.

## Geração pelo Android Studio

1. Abra a pasta `PorteiroFacil` no Android Studio.
2. Aguarde o Gradle Sync terminar.
3. Use o MENU: `Build > Generate Bundle(s) / APK(s) > Generate APK(s)`.
4. Não digite os sinais `>` no Terminal.
5. Ao concluir, procure `app-debug.apk` em `app/build/outputs/apk/debug/`.

Para distribuição institucional, use `Build > Generate Signed App Bundle or APK` e assine com o keystore da instituição.
