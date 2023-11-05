# Рекомендации по настройке репозитория

Описаны включенные опции.

## General

### Pull Requests

- Allow squash merging 
- Always suggest updating pull request branches
- Automatically delete head branches

## Branches

### Branch protection rules

- Require a pull request before merging
  - Require review from Code Owners
- Require status checks to pass before merging
  - Require branches to be up to date before merging
  - Status checks that are required
    - atlantis/policy_check
    - atlantis/plan
- Require linear history
- Do not allow bypassing the above settings
