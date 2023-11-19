# Первоначальная настройка GitHub репозитоиря

## Рекомендации по настройке репозитория

Описаны включенные опции.

- General
  - Pull Requests
    - Allow squash merging 
    - Always suggest updating pull request branches
    - Automatically delete head branches
- Branches
  - Branch protection rules
    - Require a pull request before merging
      - Require review from Code Owners
    - Require status checks to pass before merging
      - Require branches to be up to date before merging
      - Status checks that are required
        - atlantis/policy_check
        - atlantis/plan
    - Require linear history
    - Do not allow bypassing the above settings

# Настройка секретов для работы GitHub Actions

Нам нужно создать секреты в настройках репозитория: `GITHUB_USERNAME` и `GITHUB_TOKEN`.

1. `GITHUB_USERNAME`: Это просто ваше имя пользователя на GitHub. Если вы уже зарегистрировались на GitHub, вы должны знать свое имя пользователя. Это то имя, которое вы используете для входа в GitHub.

2. `GITHUB_TOKEN`: Это персональный токен доступа (Personal Access Token) на GitHub. Вот как вы можете создать его:

   - Войдите в свою учетную запись GitHub.
   - Нажмите на свою фотографию профиля в правом верхнем углу и выберите "Settings".
   - В левой панели навигации выберите "Developer settings".
   - Затем выберите "Personal access tokens".
   - Нажмите "Generate new token".
   - Введите описание для токена, выберите необходимые разрешения (для работы с GitHub Packages вам потребуется разрешение `write:packages`) и нажмите "Generate token".
   - Скопируйте новый токен и сохраните его в безопасном месте. Он не будет показан снова.
