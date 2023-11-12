# devops-practice-terraform

## Описание

Цель создания данного репозитория - помощь в освоении практик DevOps/SRE на примере пет-приекта в Яндекс облаке.

## Структура репозитория

- [docs](docs) - документация.
  - [cloud-init.md](docs/cloud-init.md) - первоначальная настройка облака.
  - [git-commit.md](docs/git-commits.md) - рекомендации по commit сообщениям.
  - [repo.md](docs/repo.md) - рекомендации по настройке репозитория.

## Порядок настройки инструментов

1. Сделайте форк этого репозитория; настройке его ([docs/repo.md](docs/repo.md)).
2. Установите `docker` ([Install Docker Engine](https://docs.docker.com/engine/install/)).
3. Установите `vscode` ([Download Visual Studio Code](https://code.visualstudio.com/download)). 
4. Установите расширение для `vscode` для работы с dev-контейнерами (ms-vscode-remote.remote-containers). Дальнейшую работу с рекомендуется продолжать в dev контейнере через `vscode`.
5. Настройте Яндекс облако ([docs/cloud-init.md](docs/cloud-init.md)).

## Локальная разработка

Наберите из корня репозитория команду и следуйте ее подсказкам:

```bash
make
```
