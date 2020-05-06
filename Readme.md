# Sonarqube + SonarQube 1C (BSL) Community Plugin

Образ сервера sonarqube c предустановленными плагинами:

-  [SonarQube 1C (BSL) Community Plugin](https://github.com/1c-syntax/sonar-bsl-plugin-community) 
- [Sonarqube Community Branch Plugin](https://github.com/mc1arke/sonarqube-community-branch-plugin)
- [SonarQube Russian Language Pack](https://github.com/silverbulleters/sonar-l10n-ru)

# Как развернуть?


1. Клонируем репозиторий командой 
```
    git clone https://github.com/TheDemonCat/sonar-bsl-docker.git
```
2. Переходим в каталог 
```
    cd sonar-bsl-docker
```
3. Запускаем инстанс Sonarqube

```
    docker-compose up -d
```
4. Сервер сонара после развертывания доступен по адресу `http://localhost:9000` (логин\пароль - admin)

5. Данные контейнера хранятся в именованных волюмах.

