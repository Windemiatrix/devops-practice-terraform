# Настройка Atlantis

## Docker образ с Atlantis

Нам нужно применить конфигурацию из директории `infrastructure/registry`, чтобы создать Container Registry и Service Account, с которым GitHub Actions будут авторизовываться.

Поменяйте переменные в файле `locals.tf` в соответствии с вашим окружением.

После применения конфигурации добавьте секреты в репозиторий GitHub:

- `YA_CR_ID` - `yandex_lockbox_secret_version.gha.YA_CR_ID`
- `YA_CR_USERNAME` - `yandex_lockbox_secret_version.gha.YA_CR_USERNAME`
- `YA_CR_PASSWORD` - `yandex_lockbox_secret_version.gha.YA_CR_PASSWORD`
- `DOCKER_REGISTRY` - `yandex_lockbox_secret_version.gha.DOCKER_REGISTRY`
