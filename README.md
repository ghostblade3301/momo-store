# Дипломный проект.
Основные задачи:
1. Необходимо реализовать полный цикл сборки-поставки приложения, используя практики CI/CD.
2. Хранить код в GitLab с использованием любого git-flow
3. Артефакты сборки (бинарные файлы, docker-образы или др.) публикуются в систему хранения (Nexus или аналоги)
4. Артефакты сборки версионируются
5. Написаны Dockerfile'ы для сборки Docker-образов бэкенда и фронтенда
    - Бэкенд: бинарный файл Go в Docker-образе
    - Фронтенд: HTML-страница раздаётся с Nginx
6. Kubernetes-кластер описан в виде кода, и код хранится в репозитории GitLab
7. Написан Helm-чарт для публикации приложения
8. Приложение подключено к системам логирования и мониторинга
9. Есть дашборд, в котором можно посмотреть логи и состояние приложения

## Структура проекта.
```sh
├── backend
│   ├── cmd
│   ├── go.mod
│   ├── go.sum
│   └── internal
├── frontend
│   ├── babel.config.js
│   ├── package.json
│   ├── package-lock.json
│   ├── public
│   ├── src
│   ├── tsconfig.json
│   └── vue.config.js
├── infra
│   ├── clusterissuers
│   ├── docker
│   ├── helm
│   ├── kubernetes
│   └── terraform
└── README.md
```

# YandexCloud

Для реализации инфраструктуры приложения в облаке был выбран Managed Kubernetes Service в яндекс облаке.

![cloud1](https://gitlab.praktikum-services.ru/std-026-35/momo-store/-/raw/dev/screenshots/cloud1.png?ref_type=heads)

Также из сервисов яндекс облака был установлен балансировщик ingress-nginx

![cloud2](https://gitlab.praktikum-services.ru/std-026-35/momo-store/-/raw/dev/screenshots/cloud2.png?ref_type=heads)

# Реализация цикла CI/CD приложения
Реализован цикл сборки, тестирования и доставки артефактов приложения в репозиторий. В GitlabCI организован pipeline в котором присутствуют данные этапы:

![gitlab1](https://gitlab.praktikum-services.ru/std-026-35/momo-store/-/raw/dev/screenshots/gitlab1.png?ref_type=heads)
![gitlab2](https://gitlab.praktikum-services.ru/std-026-35/momo-store/-/raw/dev/screenshots/gitlab2.png?ref_type=heads)

## Build

На этом этапе осуществляется сборка артефактов приложения и сборка Docker образов. Артефакты после сборки тегируются и загружаются в Nexus repository

![nexus1](https://gitlab.praktikum-services.ru/std-026-35/momo-store/-/raw/dev/screenshots/nexus1.png?ref_type=heads) 
## Test

На этапе Test осуществляется проверка кода Sonarqube и SAST

![sonarqube1](https://gitlab.praktikum-services.ru/std-026-35/momo-store/-/raw/dev/screenshots/sonarqube1.png?ref_type=heads)
## Release

Если проверка прошла успешно, то Docker образы тэгируются и загружаются в Gitlab Container Registry

![gitlab-registry1](https://gitlab.praktikum-services.ru/std-026-35/momo-store/-/raw/dev/screenshots/gitlab-registry1.png?ref_type=heads)
![gitlab-registry1](https://gitlab.praktikum-services.ru/std-026-35/momo-store/-/raw/dev/screenshots/gitlab-registry2.png?ref_type=heads)

# Доставка приложения

Для этой цели был выбран инструмент gitops - ArgoCD.
Его плюсы:
1. Удобный интерфейс. Очень наглядное представление развернутых в Kubernetes сущностей.
2. Постоянная синхронизация.
3. Удобный просмотр логов. 

![argo1](https://gitlab.praktikum-services.ru/std-026-35/momo-store/-/raw/dev/screenshots/argo2.png?ref_type=heads)
![argo2](https://gitlab.praktikum-services.ru/std-026-35/momo-store/-/raw/dev/screenshots/argo1.png?ref_type=heads)

# Мониторинг

Мониторинг кластера осуществляется стэком Prometheus/Grafana. Prometheus снимает метрики с компонентов кластера и приложений, Grafana визуализирует эти данные в графическом интерфейсе и представляет их в виде удобно настраиваемых дашбордов.

![grafana1](https://gitlab.praktikum-services.ru/std-026-35/momo-store/-/raw/dev/screenshots/grafana1.png?ref_type=heads)

# Url's

1. Фронтенд приложения - https://momo-store.wownage.ru/
2. Дашборды Grafana - https://grafana.wownage.ru/
