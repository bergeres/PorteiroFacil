@echo off
setlocal
cd /d "%~dp0"
echo ================================================
echo PORTEIRO FACIL - LIMPAR CONFIGURACAO ANTIGA
 echo ================================================
echo.
echo IMPORTANTE: feche o Android Studio antes de continuar.
echo Este procedimento NAO apaga o codigo-fonte.
echo Ele remove somente configuracoes/cache locais que podem estar
 echo tentando executar a tarefa Gradle incorreta ^>.
echo.
pause

if exist ".idea" (
    if exist ".idea_backup_porteirofacil" rmdir /s /q ".idea_backup_porteirofacil"
    ren ".idea" ".idea_backup_porteirofacil"
    echo Configuracao .idea antiga movida para .idea_backup_porteirofacil
) else (
    echo Nenhuma pasta .idea encontrada.
)

if exist ".gradle" (
    rmdir /s /q ".gradle"
    echo Cache .gradle local removido.
) else (
    echo Nenhum cache .gradle local encontrado.
)

echo.
echo PRONTO.
echo Agora abra esta pasta como NOVO projeto no Android Studio.
echo Aguarde o Gradle Sync terminar.
echo Para executar o app selecione a configuracao Android "app".
echo Para gerar APK, CLIQUE nos menus do Android Studio; nao digite o sinal ^>.
echo.
pause
